<?php
include_once('../../models/users.class.php');
$headers = getallheaders();
if(isset($headers['Authorization'])) {
  $token = $headers['Authorization'];

  $auth = Users::auth($token);

  if (!$auth) {
    return json_encode(array('error' => 'usuário não atorizado!'));
    exit();
  }

} else {
  return json_encode(array('error' => 'usuário não atorizado!'));
  exit();
}
?>
