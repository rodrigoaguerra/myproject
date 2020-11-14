<?php
include_once BASEURL . '/config.php';
include_once DBAPI;
include_once 'src/models/Validation.php';

/**
*  Class Users
*/
class Customers
{
	/**
  * LIST users from DB
  */
  public static function list(){
		$customers = Database::select(null, 'customers');

		// has users
		if(!empty($customers)){
      $resp = array();
      foreach ($customers as $customer) {
        $customer['address'] = Database::select(null, 'address', null, 'address_id', $customer['address']);
        array_push($resp, $customer);
      }
			return $resp;
		}

		return array('error' => 'Nenhum usuário encontrado.');
  }

  /**
  * create customer
  */
  public static function create($data){
    try {
      if(Valid::customer($data)) {
        $today = date_create('now', new DateTimeZone('America/Sao_Paulo'));
        $today = $today->format("Y-m-d h:i:s");

        $data['created'] = $data['address']['created'] = $today;
        $data['modified'] = $data['address']['modified'] = $today;
        $address = Database::insert('address', $data['address']);
        $data['address'] = $address;
        $data['birthdate'] = date($data['birthdate']);
        $customer = Database::insert('customers', $data);

        if($customer) return array('success' => 'Cliente registrado com sucesso.', 'id' => $customer);
        throw new Exception('Problema ao registrar o cliente.');
      }
      throw new Exception('Problema ao registrar o cliente.');
    } catch (Exception $error) {
		  error_log('Create customer : '.  $error->getMessage());
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
        Database::update('customers', 'customer_id', $id, $data);
        $address = Database::update('address', 'address_id', $address['address_id'], $address);
        return array('success' => 'Cliente atualizado com sucesso.');
      }
      throw new Exception('Dados inválidos.');
    } catch (Exception $error) {
		  error_log('Edit customer : '.  $error->getMessage());
      return array('error' => 'Problema ao atualizar o cliente.');
    }
  }

  /**
   * remove customer in DB
   */
  public static function remove($id) {
    try {
      $data = Database::select(['address'], 'customers', null, 'customer_id', $id);
      Database::delete('address', 'address_id', $data['address']);
      Database::delete('customers', 'customer_id', $id);
      return array('success' => 'Cliente deletado com sucesso.');
    } catch (Exception $error) {
		  error_log('Remove customer : '.  $error->getMessage());
      return array('error' => 'Problema ao deletar o cliente.');
    }
  }
}
