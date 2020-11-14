<?php
include_once 'src/controllers/config.php';
include_once '../../models/users.class.php';

if($_POST['action'] === "user_login"){
  $id = $_POST['auth-id'];
  $type = $_POST['auth-level'];

  $answer = Users::validUser($id, $type);

  if($answer){
    echo json_encode(array('success' => 'usuário autorizado com sucesso!'));
	}else{
    echo json_encode(array('error' => 'não foi possível autorizar usuário!'));
	}
}else{
  echo json_encode(array('error' => 'formulário invalido', 'POST' => $_POST));
}

?>
