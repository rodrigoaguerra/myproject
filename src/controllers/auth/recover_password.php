<?php
  include_once 'src/model/users.class.php';
  include_once 'src/model/email.class.php';
  include_once 'src/model/validInputs.class.php';

  if($_POST['action'] === 'recover_password' && $_POST['token'] !== ''){
  	unset($_POST['action']);
  	/**
  	* Deal with inputs of the user
  	*/
  	// Validate email
  	$valid = ValidInputs::validPassword($_POST['password']);
    $valid = ValidInputs::validToken($_POST['token']);
		if(!isset($valid['error'])){
      $data = Users::recoverPassword($_POST['token'], $_POST['password']);
      if($data !== NULL) {
        echo json_encode(array('success' => 'A sua senha foi redefinida!'));
      }else{
        echo json_encode(array('error' => 'Não foi possivel redefinir sua senha.'));
      }
    }else{
      echo json_encode(array('error' => $error));
    }
  }else{
    echo json_encode(array('error' => 'A informação de recuperação de senha não foram definidas corretamente.'));
  }
?>
