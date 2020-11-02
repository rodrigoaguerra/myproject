<?php
	header("Access-Control-Allow-Origin: *");
	$rest_json = file_get_contents("php://input");
	$_POST = json_decode($rest_json, true);
	include_once('../../models/customers.class.php');
	include_once('../../models/validInputs.class.php');

  if($_POST['action'] === 'customers_register'){
  	unset($_POST['action']);

  	// Validate firstName
  	$_POST['name'] = ValidInputs::validInput($_POST['firstname'], 'firstname', 25, "/[A-záàâãéèêíïóôõöúçñ]/");
  	if(isset($_POST['name']['error'])){
			$error = json_encode($_POST['name']['error']);
		}

  	// Validate email
  	$_POST['email'] = ValidInputs::validEmail($_POST['email']);
		if(isset($_POST['email']['error'])){
			$error = json_encode($_POST['email']['error']);
		}

		if(!isset($error)){
			// set e-mail valid
			$_POST['email'] = $_POST['email']['success'];

      // register user acount
			$data = Customers::register();

			// check if email has already been registered.
			echo json_encode($data);
		}else{
			echo $error;
		}
  }else{
  	echo json_encode(array('error' => 'Informações do cliente não foram definidas corretamente.'));
  }
?>
