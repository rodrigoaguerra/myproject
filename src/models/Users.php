<?php 

declare(strict_types=1);

include_once BASEURL . '/config.php';
include_once DBAPI;
include_once dirname(__FILE__) . '/Crypt.php';
include_once dirname(__FILE__) . '/SendEmail.php';

final class Users
{
	/**
  * LIST users from DB
  * @return array<string>
  */
  public static function list(): array {
		$users = Database::select(['id', 'firstname', 'lastname', 'email', 'status', 'type', 'date_create'], 'users');
		if($users){
			return array('success' => 'Lista de usuários', 'users' => $users);
		}

		return array('error' => 'Nenhum usuário encontrado.');
  }

	/**
  * Register user in DB
  * @param array<string> $user
  * @return array<string>
  */
  public static function create(array $user):array {
    try {
			// check if email has already been registered.
			$email = Database::select(['id', 'email', 'status'], 'users', NULL, 'email', $user['email']);
			if($email !== NULL) {
        throw new Exception('E-mail já está cadastrado no sistema.');
      } 
			$options = ['cost' => 11, 'salt' => random_bytes(22)];
			$user['password'] = password_hash($user['password'], PASSWORD_BCRYPT, $options);
	    $today = date_create('now', new DateTimeZone('America/Sao_Paulo'));
	    $user['date_create'] = $today->format("Y-m-d");
	    $user['type'] = -1;
	    $user['status'] = -1;
      $user_id = Database::insert('users', $user);
      $token = self::createToken($user_id, 'validemail');
			return SendEmail::validAccount($user['email'], $token);
		} catch (Exception $error) {
		  return array('error' => $error->getMessage());
		}
  }

  /**
  * Edit user in DB
  * @param array<string> $user
  * @return array<string>
  */
  public static function edit(array $user):array {
    try {
 			Database::update('users', 'id', $id, $user);
			return array('success' => 'Usuário atualizado com sucesso.');
		} catch (Exception $error) {
		  return array('error' => $error->getMessage());
		}
  }

  /**
  *	Execute login from user
  * @return array<string>
  */
  public static function login(string $email, string $password): array {
		try {
			$user = Database::select(['id', 'password', 'type', 'status'], 'users', NULL, 'email', $email);
			// usuário não encontrado ou senha incorreta
 			if($user === NULL || !password_verify($password, $user['password'])){
				throw new Exception('Error ao executar o login, verifique seu e-mail e senha.');
			}
			// usuário não validado
			if($user['type'] === '-1' || $user['status'] === '-1' ) {
				throw new Exception('O e-mail do usuário não foi validado ainda, acesse seu email e clique no link para  ativar sua conta.');
      }
      $token = self::createToken(intval($user['id']), 'login');
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
  * @return array<bool>
	*/
	public static function logout(string $token): array{
		$token = str_replace('Bearer ', '', $token);
	  Database::delete('tokens', 'token', $token);
		return array('success' => true);
	}

	/**
   * Auth user
 	*/
	public static function auth(string $token): bool {
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
  * @return array<string>
  */
  public static function validAccount(string $token): array {
	 	try {
			$user = Database::select(NULL, 'users', array('tokens' => 'tokens.user_id = users.id' ), 'token', $token);
			$date = date_create('now', new DateTimeZone('America/Sao_Paulo'))->format("Y-m-d h:i:s");
	 		$date_valid = date('Y-m-d H:i:s', strtotime($user['datetime'] . ' +6 hour'));
			$actions = array('createcont', 'validemail');
			if (!$user || !in_array($user['action'], $actions) || $date >= $date_valid) {
        throw new Exception("${token} - erro ao validar token.");
      }
			Database::update('users', 'id', $user['id'], array('status' => 0));
		  Database::delete('tokens', 'token', $token);
			return array('success' => $user['email']);
		} catch (Exception $error) {
			if(DEBUG) {
			 error_log('Error in users token: '. $error->getMessage());
			}
	    Database::delete('tokens', 'token', $token);
			return array('error' => $error->getMessage());
		}
	}

	/**
  *	Reset password users
  * @return array<string>
  */
  public static function requireRecoverPassword(string $email):array {
		try {
			// check if email has already been registered.
			$user = Database::select(['id', 'firstname', 'lastname', 'email'], 'users', NULL, 'email', $email);
			// usuário não encontrado
			if(!$user){ 
        throw new Exception('Nenhum usuário encontrado');
      }
			SendEmail::recoverPassword($user['email'], self::createToken(intval($user['id']), 'recoverpass'));
			return array('success' => 'Recuperação de senha solicitada, verifique seu e-mail.');
		} catch (Exception $error) {
			return array('error' => $error->getMessage());
		}
	}

	/**
   * Recover user password
   * @return array<string> 
   */
	public static function recoverPassword(string $token, string $password): array {
		try {
	  	$user = Database::select(NULL, 'users', array('tokens' => 'tokens.user_id = users.id' ), 'token', $token);
			$date = date_create('now', new DateTimeZone('America/Sao_Paulo'))->format("Y-m-d h:i:s");
		  $date_valid = date('Y-m-d H:i:s', strtotime($user['datetime'] . ' +6 hour'));
			if (!$user || $date >= $date_valid || $user['action'] !== 'recoverpass'){
				throw new Exception("Erro ao recuperar senha!");
      }
			$newpass = password_hash($password, PASSWORD_BCRYPT, ['cost' => 11, 'salt' => random_bytes(22)]);
			Database::update('users', 'id', $user['id'], array('password' => $newpass));
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
  private static function createToken(int $user_id, string $action): string {
		try {
  		$token = Crypt::createToken();
			if($token === NULL) {
				throw new Exception("Erro ao criar token", 1);
			}
      $today = date_create('now', new DateTimeZone('America/Sao_Paulo'));
      $insert = array('token' => $token, 'user_id' => $user_id, 'datetime' => $today->format("Y-m-d h:i:s"), 'action' => $action);
	    Database::insert('tokens', $insert);
	    return $token;
		} catch (Exception $error) {
		  return NULL;
		}
	}
}
