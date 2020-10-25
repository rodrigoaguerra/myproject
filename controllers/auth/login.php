<?php
header("Access-Control-Allow-Origin: *");
$rest_json = file_get_contents("php://input");
$_POST = json_decode($rest_json, true);
include_once('../../models/users.class.php');
include_once('../../models/validInputs.class.php');

if($_POST['action'] === 'user_login'){
  unset($_POST['action']);
  $error = NULL;

  // Validate email
  $email = ValidInputs::validEmail($_POST['email']);
  if(isset($email['error'])){
    $error = json_encode($email['error']);
  }

  $password = ValidInputs::validPassword($_POST['password']);

  if(isset($password['error'])){
    $error = json_encode($password['error']);
  }

  if ($error === NULL) {
    echo Users::login($_POST['email'], $_POST['password']);
  }else{
    echo json_encode(array('error' => $error));
  }

}else{
  echo json_encode(array('error' => 'As informações de login não foram definidas corretamente.'));
}
?>
