<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Authorization, Origin, X-Requested-With, Content-Type, Accept");
include_once('../../models/users.class.php');
include_once('./auth.php');

try {
  // list users on the system
  $data = Users::list();

  // verific if has error
  if(!isset($data['error'])){
    echo json_encode(array('success' => 'Lista de usuários', 'data' => $data));
  }else{
    echo json_encode(array('error' => $data['error']));
  }
} catch (Exception $error) {
  echo json_encode(array('error' => $error));
}
?>
