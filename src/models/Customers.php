<?php
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
		$customers = Db::select(null, 'customers');

		// has users
		if(!empty($customers)){
      $resp = array();
      foreach ($customers as $customer) {
        $customer['address'] = Db::select(null, 'address', null, 'address_id', $customer['address']);
        array_push($resp, $customer);
      }
			return $resp;
		}else{
			return array('error' => 'Nenhum usuário encontrado.');
		}
  }

  /**
  * create customer
  **/
  public static function create($data){
    try {
      if(Valid::customer($data)) {
        $today = date_create('now', new DateTimeZone('America/Sao_Paulo'));
        $today = $today->format("Y-m-d h:i:s");

        $data['created'] = $data['address']['created'] = $today;
        $data['modified'] = $data['address']['modified'] = $today;
        $address = Db::insert('address', $data['address']);
        $data['address'] = $address;
        $data['birthdate'] = date($data['birthdate']);
        $customer = Db::insert('customers', $data);

        if($customer){
          return array('success' => 'Cliente registrado com sucesso.', 'id' => $customer);
        } else {
          throw new Exception('Problema ao registrar o cliente.');
        }
      } else {
        throw new Exception('Problema ao registrar o cliente.');
      }
    } catch (Exception $e) {
		  error_log('Create customer : '.  $e->getMessage());
      return array('error' => 'Problema ao registrar o cliente.');
    }
  }

  /**
   * Edit customer in DB
   */
  public static function edit($data){
    try {
      if(Valid::customer($data)) {
        $today = date_create('now', new DateTimeZone('America/Sao_Paulo'));
        $today = $today->format("Y-m-d h:i:s");
        $data['modified'] = $data['address']['modified'] = $today;
        $address = $data['address'];
        $id = $data['customer_id'];
        unset($data['customer_id'], $data['address']);
        $customer = Db::update('customers', 'customer_id', $id, $data);
        $address = Db::update('address', 'address_id', $address['address_id'], $address);
        // $customer['address'] = $address;
        return array('success' => 'Cliente atualizado com sucesso.');
      } else {
        throw new Exception('Dados inválidos.');
      }
    } catch (Exception $e) {
		  error_log('Edit customer : '.  $e->getMessage());
      return array('error' => 'Problema ao atualizar o cliente.');
    }
  }

  /**
   * remove customer in DB
   */
  public static function remove($id) {
    try {
      $data = Db::select(['address'], 'customers', null, 'customer_id', $id);
      Db::delete('address', 'address_id', $data['address']);
      Db::delete('customers', 'customer_id', $id);
      return array('success' => 'Cliente deletado com sucesso.');
    } catch (Exception $e) {
		  error_log('Remove customer : '.  $e->getMessage());
      return array('error' => 'Problema ao deletar o cliente.');
    }
  }
}
