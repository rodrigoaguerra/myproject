<?php
include_once '../../models/Users.php';
$headers = getallheaders();
try {
  if(!isset($headers['Authorization'])) {
    throw new Exception('token não definido!');
  }

  $auth = Users::auth($headers['Authorization']);

  if (!$auth) {
    throw new Exception('usuário não atorizado!');
  }
} catch (Exception $error) {
  echo json_encode(array('error' => $error));
  exit;
}
?>
