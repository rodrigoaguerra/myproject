<?php
	include_once 'src/controllers/config.php';
	include_once '../../models/users.class.php';
	include_once '../../models/validInputs.class.php';

  if($_POST['action'] === 'user_register'){
  	unset($_POST['action']);
  	/*
  	* Deal with inputs of the user
  	*/
  	// Validate firstName
  	$_POST['firstname'] = ValidInputs::validInput($_POST['firstname'], 'firstname', 25, "/[A-záàâãéèêíïóôõöúçñ]/");
  	if(isset($_POST['firstname']['error'])){
			$error = json_encode($_POST['firstname']['error']);
		}
  	// Validate lastName
  	$_POST['lastname']  = ValidInputs::validInput($_POST['lastname'], 'lastname', 30, "/[A-záàâãéèêíïóôõöúçñ ]/");
  	if(isset($_POST['lastname']['error'])){
			$error = json_encode($_POST['lastname']['error']);
		}
  	// Validate email
  	$_POST['email'] = ValidInputs::validEmail($_POST['email']);
		if(isset($_POST['email']['error'])){
			$error = json_encode($_POST['email']['error']);
		}
		// Validade password
	  $_POST['password']  = ValidInputs::validInput($_POST['password'], 'password', 15, NULL);
	  if(isset($_POST['password']['error'])){
			$error = json_encode($_POST['password']['error']);
		}

		if(!isset($error)){
			// set e-mail valid
			$_POST['email'] = $_POST['email']['success'];
			// register user acount
			$data = Users::register();

			// check if email has already been registered.
			echo json_encode($data);
		}else{
			echo $error;
		}
  }else{
  	echo json_encode(array('error' => 'Informações do usuário não foram definidas corretamente.'));
  }
?>
