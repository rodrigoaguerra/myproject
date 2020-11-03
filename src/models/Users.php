<?php
include_once(BASEURL . '/config.php');
include_once(DBAPI);
include_once(dirname(__FILE__) . '/Crypt.php');
include_once(dirname(__FILE__) . '/Email.php');

/**
*  Class Users
*/
class Users
{
  private $user;

	/**
  * LIST users from DB
  **/
  public static function list(){
		$db = new Db();

		$users = $db->select(['id', 'firstname', 'lastname', 'email', 'status', 'type', 'date_create'],'users');

		// has users
		if(!empty($users)){
			return $users;
		}else{
			return array('error' => 'Nenhum usuário encontrado.');
		}
  }

	// gera token de acesso
  private static function createToken($user_id, $action){
  	$token = Crypt::createToken();
		if($token != NULL){
			$today = date_create('now', new DateTimeZone('America/Sao_Paulo'));
	    $insert['token'] = $token;
	    $insert['user_id'] = $user_id;
	    $insert['datetime'] = $today->format("Y-m-d h:i:s");
	  	$insert['action'] = $action;
	  	$db = new Db();
	    $db->insert('tokens', $insert);
	    return $token;
		}else{
		  return NULL;
		}
	}

  private static function sendEmailValidAcount($email_address, $user_name, $token){
  	// Send email for the user validate your acount
		$mail = new Email();
		$from = "contato@rodrigoalvesguerra.com.br";
		$name = "Rodrigo Alves Guerra";
		$subject = "Confirmação de conta";
		$content = "Uma conta foi criada em nosso sistema, com esse endereço de e-mail. Para ativa-la <a href=\"https://www.rodrigoalvesguerra.com.br/coleta-produtos/dashboard/account/valid_acount?cod=" .$token. "\">clique aqui</a>; Isto confirma a utilização desse endereço de e-mail pelo usuário " .$user_name. ", caso não você não tenha solicitado esse registro apenas ignore esse e-mail. Obrigado!";
		$altcontent = $content;
		$mail->recipients($from, $name, $email_address);
		$mail->content($subject, $content, $altcontent);
		$mail->send('Você recebeu um e-mail, para a confirmação de sua conta. Verifique sua caixa de entrada, e clique no link do e-mail para ativar sua conta!');
  }

  public static function send_valid_email($email){
  	$db = new Db();

		// get user for email
		$user = $db->select(['id', 'email', 'firstname'],
												'users', NULL, 'email', $email);

    $today = date_create('now', new DateTimeZone('America/Sao_Paulo'));
    $token = self::createToken($user['id'], 'validemail');
		if($token != NULL){
			self::sendEmailValidAcount($user['email'], $user['firstname'], $token);
		}else{
		  return array('error' => 'Problema ao criar token de acesso ao e-mail.');
		}
  }

  /**
  * Register user in DB
  **/
  public static function register(){
  	$db = new Db();
    $user = $_POST;
		error_log('POST : '. print_r($user, TRUE));

		// check if email has already been registered.
		$v_email = $db->select(['id', 'email', 'status'],'users',NULL,'email',$user['email']);

		error_log('v_email : '. print_r($v_email, TRUE));
		if($v_email === NULL){
			$options = [
	    	'cost' => 11,
	    	'salt' => random_bytes(22)
			];

			$user['password'] = password_hash($user['password'], PASSWORD_BCRYPT, $options);

	    $today = date_create('now', new DateTimeZone('America/Sao_Paulo'));
	    $user['date_create'] = $today->format("Y-m-d");

	    $user['type'] = -1;
	    $user['status'] = -1;

	    $user_id = $db->insert('users', $user);
	    $token = self::createToken($user_id, 'createcont');
			if($token != NULL){
				// error_log('Send Mail...');
				self::sendEmailValidAcount($user['email'], $user['firstname'], $token);
			  return array('success' => 'Usuário registrado, por favor valide seu e-mail.');
			}else{
				// error_log('Token Error...');
			  return array('error' => 'Problema ao criar token de acesso ao e-mail.');
			}
	  }else{
			// error_log('Email ja cadastrado ...');
	  	return array('error' => 'Esse e-mail já está cadastrado no sistema.', 'email' => $v_email['email'], 'status' => $v_email['status']);
	  }
  }

  /**
  *	Valid email from user
  **/
  public static function validEmail($token){
  	$db = new Db();
	  $user = $db->select(NULL, 'users', array('tokens' => 'tokens.user_id = users.id' ), 'token', $token);

		if(!empty($user)){

	  	$date = date_create('now', new DateTimeZone('America/Sao_Paulo'));
		  $date = $date->format("Y-m-d h:i:s");

	 		$date_valid = $user['datetime'] . ' +6 hour';
	 		$date_valid = date('Y-m-d H:i:s', strtotime($date_valid));
	 		if($date <= $date_valid && ($user['action'] === 'createcont' || $user['action'] === 'validemail')){
			  $db->update('users', 'id', $user['id'], array('status' => 0));
		    $db->delete('tokens', 'token', $token);
	 			return $user['email'];//valid
	 		}else{
	 			if(DEBUG){
					error_log('date: '. $date);
					error_log('date_valid: '. $date_valid);
					error_log('token: '. $token .' - expirado.');
		    }
		    $db->delete('tokens', 'token', $token);
	 			return NULL; //token expirado
	 		}
		}else{
 			if(DEBUG){
				error_log('token:'. $token .' - usuário não encontrado.');
	    }
	    $db->delete('tokens', 'token', $token);
	 		return NULL; //invalid
	 	}
	}

	/**
	 * Valid users from system
	 */
	public static function validUser($id, $type) {
		try {
			$db = new Db();
			$db->update('users', 'id', $id, array('status' => 1, 'type' => $type));
			$user = $db->select(NULL, 'users', NULL, 'id', $id);
			return TRUE;
		} catch (Exception $e) {
			if(DEBUG) :
			 error_log('Error in users auth: ', $e->getMessage());
			endif;
			return FALSE;
		}
	}

	/**
	 * Auth user
	 */
	public static function auth($token) {
		try {
			$token = str_replace('Bearer ', '', $token);
			$hasToken = Db::select(NULL, 'tokens', NULL, 'token', $token);
			return $hasToken !== NULL;
		} catch (Exception $e) {
			if(DEBUG) :
			 error_log('Error in users auth: '. $e->getMessage());
			endif;
			return FALSE;
		}
	}

  /**
  *	login user
  **/
  public static function login($email, $password){
	  $user = Db::select(['id', 'password', 'type', 'status'], 'users', NULL, 'email', $email);

		//Password valid;
 		if(password_verify($password, $user['password'])) {
 			if($user['type'] !== '-1' && $user['status'] !== '-1'){
				$token = self::createToken($user['id'], 'login');
				session_start();
				$_SESSION['token'] = $token;
				$_SESSION['login'] = 1;
				$_SESSION['user_type'] = intval($user['type']);
				$_SESSION['user_status'] = $user['status'];
				// session_abort(); não executa login
				return json_encode(array('success' => 'autorizado', 'data' => $token));
			}
			return json_encode(array('error' => 'O e-mail do usuário não foi validado ainda, acesse seu email e clique no link para  ativar sua conta.'));
		}else{
		  //Password invalid;
		  return json_encode(array('error' => 'Error ao executar o login, verifique seu e-mail e senha.'));
		}
	}

	/**
  *	reset password users
  **/
  public static function requireRecoverPassword($email){
	  $db = new Db();

		// check if email has already been registered.
		$user = $db->select(['id', 'firstname', 'lastname', 'email'],'users',NULL,'email', $email);

		if($user !== NULL){
			$name = $user['firstname'] . ' ' . $user['lastname'];

			$token = self::createToken($user['id'], 'recovepass');
			if($token != NULL){
				return array('name'=> $name, 'hash' => $token);
			}else{
			  return array('error' => 'Problema ao criar token de acesso ao e-mail.');
			}
		}else{
	  	return array('error' => 'Esse e-mail não está cadastrado no sistema.');
	  }
	}

	// valid user token
	public static function recoverPassword($token, $password){
		$db = new Db();
	  $user = $db->select(NULL, 'users', array('tokens' => 'tokens.user_id = users.id' ), 'token', $token);
		if(!empty($user)){
		 	$date = date_create('now', new DateTimeZone('America/Sao_Paulo'));
		  $date = $date->format("Y-m-d h:i:s");

	 		$date_valid = $user['datetime'] . ' +6 hour';
	 		$date_valid = date('Y-m-d H:i:s', strtotime($date_valid));
	 		if($date <= $date_valid && ($user['action'] === 'recovepass')){
				$options = [
						'cost' => 11,
						'salt' => random_bytes(22)
					];

				$newPassword = password_hash($password, PASSWORD_BCRYPT, $options);
				$db->update('users', 'id', $user['id'], array('password' => $newPassword));
		    $db->delete('tokens', 'token', $token);
				return $user['email']; //valid
	 		}else{
	 			if(DEBUG){
					error_log('date: '. $date);
					error_log('date_valid: '. $date_valid);
					error_log('token: '. $token .' - expirado.');
		    }
		    $db->delete('tokens', 'token', $token);
	 			return NULL; //token expirado
	 		}
		}else{
 			if(DEBUG){
				error_log('token:'. $token .' - usuário não encontrado.');
	    }
	    $db->delete('tokens', 'token', $token);
	 		return NULL; //invalid
	 	}
	}

	/**
	* logout user
	**/
	public static function logout(){
		session_start();
		session_unset();
		session_destroy();
		error_log('Logout finish !');
		return json_encode(array('success' => 'dashboard.php'));
	}
}
