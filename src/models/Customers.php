<?php

// error_log('EDIT : '. print_r(dirname(getcwd()), TRUE));
require_once('./config.php');
include_once(DBAPI);
include_once('src/models/Validation.php');

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
		$customers = Db::select(['id', 'firstname', 'lastname', 'email', 'status', 'type', 'date_create'],'users');

		// has users
		if(!empty($customers)){
			return $customer;
		}else{
			return array('error' => 'Nenhum usuário encontrado.');
		}
  }

  /**
  * create customer
  **/
  public static function create($data){
    $valid = Valid::customer($data);

    if($valid) {

      $today = date_create('now', new DateTimeZone('America/Sao_Paulo'));
		  $today = $today->format("Y-m-d h:i:s");

      $data['created'] = $data['address']['created'] = $today;
      $data['modified'] = $data['address']['modified'] = $today;
      $address = Db::insert('address', $data['address']);
      $data['address'] = $address;
      $data['birthdate'] = date($data['birthdate']);
      $customer = Db::insert('customers', $data);

      if($customer){
        return array('success' => 'Cliente registrado com sucesso.');
      } else {
        return array('error' => 'Problema ao registrar o cliente.');
      }

    } else {
      return array('error' => 'Problema ao registrar o cliente.');
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
