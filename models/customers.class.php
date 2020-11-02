<?php
include_once('../../config.php');
include_once(DBAPI);
include_once('crypt.class.php');
include_once('email.class.php');

/**
*  Class Users
*/
class Customers
{
  private $customer;

	/**
  * LIST users from DB
  **/
  public static function list(){
		$db = new Db();

		$customers = $db->select(['id', 'firstname', 'lastname', 'email', 'status', 'type', 'date_create'],'users');

		// has users
		if(!empty($customers)){
			return $customer;
		}else{
			return array('error' => 'Nenhum usuário encontrado.');
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
   * Edit customer in DB
   */
  public static function edit(){
		$customer = $_POST;
		error_log('EDIT : '. print_r($customer, TRUE));
  }

  /**
   * remove customer in DB
   */
  public static function remove() {
    $customer = $_POST;
		error_log('DELETE : '. print_r($customer, TRUE));
  }
}
