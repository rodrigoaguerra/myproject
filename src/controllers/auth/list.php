<?php
include_once('../setup.php');
include_once('./auth.php');

try {
  // list users on the system
  $data = Users::list();

  // verific if has error
  if(isset($data['error'])){
    throw new Exception($data['error']);
  }

  echo json_encode(array('success' => 'Lista de usuários', 'data' => $data));
} catch (Exception $error) {
  echo json_encode(array('error' => $error));
}
?>
