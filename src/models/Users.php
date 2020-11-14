<?php
declare(strict_types=1);
include_once BASEURL . '/config.php';
include_once DBAPI;
include_once dirname(__FILE__) . '/Crypt.php';
include_once dirname(__FILE__) . '/Email.php';

/**
*  Class Users
*/
class Users
{
	/**
  * LIST users from DB
  */
  public static function list(){
		$users = Database::select(['id', 'firstname', 'lastname', 'email', 'status', 'type', 'date_create'], 'users');

		// has users
		if(!empty($users)){
			return array('success' => 'Lista de usuários', 'users' => $users);
		}

		return array('error' => 'Nenhum usuário encontrado.');
  }

	/**
  * Register user in DB
  */
  public static function create(array $user){
    try {
			// check if email has already been registered.
			$email = Database::select(['id', 'email', 'status'], 'users', NULL, 'email', $user['email']);

			if($email !== NULL) throw new Exception('E-mail já está cadastrado no sistema.');

			$options = ['cost' => 11, 'salt' => random_bytes(22)];

			$user['password'] = password_hash($user['password'], PASSWORD_BCRYPT, $options);

	    $today = date_create('now', new DateTimeZone('America/Sao_Paulo'));
	    $user['date_create'] = $today->format("Y-m-d");

	    $user['type'] = -1;
	    $user['status'] = -1;

	    Database::insert('users', $user);

			self::sendEmailValidAccount($user['email']);
			return array('success' => 'Usuário registrado, por favor valide seu e-mail.');
		} catch (Exception $error) {
		  return array('error' => $error->getMessage());
		}
  }

  /**
  *	login user
  */
  public static function login(string $email, string $password) {
		try {
			// seleciona usuário
	  	$user = Database::select(['id', 'password', 'type', 'status'], 'users', NULL, 'email', $email);

			// usuário não encontrado
			if($user === NULL) throw new Exception('Nenhum usuário encontrado');

			// senha incorreta
 			if(!password_verify($password, $user['password'])){
				throw new Exception('Error ao executar o login, verifique seu e-mail e senha.');
			}

			// usuário não validado
			if($user['type'] === '-1' || $user['status'] === '-1' ) {
				throw new Exception('O e-mail do usuário não foi validado ainda, acesse seu email e clique no link para  ativar sua conta.');
			}

			$token = self::createToken($user['id'], 'login');

			if(!$token) {
				throw new Exception("Error ao criar token");
			}

			return array('success' => 'usuário autorizado', 'token' => $token, 'user' => $user);
		} catch (Exception $error) {
			error_log('Error in users login: '. $error->getMessage());
			return array('error' => $error->getMessage());
		}
	}

	/**
	* logout user
	*/
	public static function logout(string $token){
		$token = str_replace('Bearer ', '', $token);
	  Database::delete('tokens', 'token', $token);
		return array('success' => true);
	}

	/**
 	* Auth user
 	*/
	public static function auth(string $token) {
		try {
			$token = str_replace('Bearer ', '', $token);
			$hasToken = Database::select(NULL, 'tokens', NULL, 'token', $token);
			return $hasToken !== NULL;
		} catch (Exception $error) {
			if(DEBUG) {
			 error_log('Error in users auth: '. $error->getMessage());
			}
			return FALSE;
		}
	}

  /**
  *	Valid email from user
  */
  public static function validAccount(string $token){
	 	try {
			$user = Database::select(NULL, 'users', array('tokens' => 'tokens.user_id = users.id' ), 'token', $token);

			if(empty($user)) throw new Exception("${token} - usuário não encontrado.");

			$date = date_create('now', new DateTimeZone('America/Sao_Paulo'));
		  $date = $date->format("Y-m-d h:i:s");
	 		$date_valid = $user['datetime'] . ' +6 hour';
	 		$date_valid = date('Y-m-d H:i:s', strtotime($date_valid));

			$actions = array('createcont', 'validemail');

			if (!in_array($user['action'], $actions)) throw new Exception("${token} - ação é inválida.");

			if($date >= $date_valid) throw new Exception("${token} - expirado.", 1);

			Database::update('users', 'id', $user['id'], array('status' => 0));
		  Database::delete('tokens', 'token', $token);

			return $user['email'];

		} catch (Exception $error) {
			if(DEBUG) {
			 error_log('Error in users token: '. $error->getMessage());
			}
	    Database::delete('tokens', 'token', $token);
			return array('error' => $error->getMessage());
		}
	}

	/**
	 * Enable user from system
	 */
	public static function enable(string $id) {
		try {
			Database::update('users', 'id', $id, array('status' => 1));
			return TRUE;
		} catch (Exception $error) {
			if(DEBUG) {
			 error_log('Error in users auth: ', $error->getMessage());
			}
			return FALSE;
		}
	}

	/**
	 * Disable user from system
	 */
	public static function disable(string $id) {
		try {
			Database::update('users', 'id', $id, array('status' => 0));
			return TRUE;
		} catch (Exception $error) {
			if(DEBUG) {
			 error_log('Error in users auth: ', $error->getMessage());
			}
			return FALSE;
		}
	}

	/**
	 * Change Type
	 */
	public static function changeType(string $id, $type){
		try {
			Database::update('users', 'id', $id, array('type' => $type));
			return TRUE;
		} catch (Exception $error) {
			if(DEBUG) {
			 error_log('Error in users auth: ', $error->getMessage());
			}
			return FALSE;
		}
	}

	/**
  *	reset password users
  */
  public static function requireRecoverPassword(string $email){
		try {
			// check if email has already been registered.
			$user = Database::select(['id', 'firstname', 'lastname', 'email'], 'users', NULL, 'email', $email);

			// usuário não encontrado
			if($user === NULL) throw new Exception('Nenhum usuário encontrado');

			$token = self::createToken($user['id'], 'recovepass');

			// token não foi criado
			if(!$token) throw new Exception('Problema ao criar token de acesso ao e-mail.');

			self::sendEmailRecoverPassword($user['email']);

			return array('success' => 'Recuperação de senha solicitada, verifique seu e-mail.');
		} catch (Exception $error) {
			return array('error' => $error->getMessage());
		}
	}

	// valid user token
	public static function recoverPassword(string $token, string $password){
		try {
	  	$user = Database::select(NULL, 'users', array('tokens' => 'tokens.user_id = users.id' ), 'token', $token);

			if(empty($user)) throw new Exception("Usuário não encontrado!");

			$date = date_create('now', new DateTimeZone('America/Sao_Paulo'));
		  $date = $date->format("Y-m-d h:i:s");
	 		$date_valid = $user['datetime'] . ' +6 hour';
	 		$date_valid = date('Y-m-d H:i:s', strtotime($date_valid));

			if ($date >= $date_valid){
				throw new Exception("Essse token foi expirado!");
			}

			if ($user['action'] === 'recovepass'){
				throw new Exception("Ação do token é inválida!");
			}

			$options = ['cost' => 11, 'salt' => random_bytes(22)];

			$newPassword = password_hash($password, PASSWORD_BCRYPT, $options);

			Database::update('users', 'id', $user['id'], array('password' => $newPassword));
			Database::delete('tokens', 'token', $token);

			return array('success' => 'Sua senha foi redefinida com sucesso.');
		} catch (Exception $error) {
			if (DEBUG) {
				error_log("Recover passoword: ". $error->getMessage());
			}
			Database::delete('tokens', 'token', $token);
			return array('error' => $error->getMessage());
		}
	}

	// gera token de acesso
  private static function createToken($user_id, $action){
		try {
  		$token = Crypt::createToken();
			if($token === NULL) {
				throw new Exception("Erro ao criar token", 1);
			}
			$today = date_create('now', new DateTimeZone('America/Sao_Paulo'));
	    $insert['token'] = $token;
	    $insert['user_id'] = $user_id;
	    $insert['datetime'] = $today->format("Y-m-d h:i:s");
	  	$insert['action'] = $action;
	    Database::insert('tokens', $insert);
	    return $token;
		} catch (Exception $error) {
		  return FALSE;
		}
	}

  public static function sendEmailValidAccount(string $email){
		try {
			$user = Database::select(['id', 'email', 'firstname'], 'users', NULL, 'email', $email);
			$token = self::createToken($user['id'], 'validemail');
			if(!$token){
				throw new Exception('Problema ao criar token de acesso ao e-mail.', 1);
			}
			['email' => $user_email, 'firstname' => $user_name ] = $user;

			// Send email for the user validate your acount
			$mail = new Email();
			$from = "contato@rodrigoalvesguerra.com.br";
			$name = "Rodrigo Alves Guerra";
			$subject = "Confirmação de conta";
			$content = "Uma conta foi criada em nosso sistema, com esse endereço de e-mail. Para ativa-la <a href=\"".SYSTEM_URL."/account/valid_acount?cod=${token}\">clique aqui</a>; Isto confirma a utilização desse endereço de e-mail pelo usuário ${user_name}, caso não você não tenha solicitado esse registro apenas ignore esse e-mail. Obrigado!";
			$altcontent = $content;
			$mail->recipients($from, $name, $user_email);
			$mail->content($subject, $content, $altcontent);
			$mail->send('Você recebeu um e-mail, para a confirmação de sua conta. Verifique sua caixa de entrada, e clique no link do e-mail para ativar sua conta!');
		} catch (Exception $error) {
		  return array('error' => $error->getMessage());
		}
  }

	public static function sendEmailRecoverPassword(string $email){
		try {
			$user = Database::select(['id', 'email', 'firstname'], 'users', NULL, 'email', $email);
			$token = self::createToken($user['id'], 'recoverpass');
			if(!$token){
				throw new Exception('Problema ao criar token de acesso ao e-mail.', 1);
			}

			['email' => $user_email, 'firstname' => $user_name ] = $user;

			// Send email for the user validate your acount
			$mail = new Email();
			$from = "contato@rodrigoalvesguerra.com.br";
			$name = "Rodrigo Alves Guerra";
			$subject = "Recuperação de senha";
			$content = "Olá ${user_name}, uma solicitação de recuparação de senha, foi feita no sistema. Para alterar sua senha <a href=\"".SYSTEM_URL."/account/recover?cod=${token}\">clique aqui</a>, caso não você não tenha solicitado esse registro apenas ignore esse e-mail. Obrigado!";
			$altcontent = $content;
			$mail->recipients($from, $name, $user_email);
			$mail->content($subject, $content, $altcontent);
			$mail->send('Você recebeu um e-mail, para a confirmação de sua conta. Verifique sua caixa de entrada, e clique no link do e-mail para ativar sua conta!');
		} catch (Exception $error) {
		  return array('error' => $error->getMessage());
		}
	}
}
