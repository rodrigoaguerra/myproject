<?php
include_once('../setup.php');
include_once('../../models/Users.php');
include_once('../../models/Validation.php');

try {
  if(!isset($_POST['action']))
    throw new Exception('As informações de login não foram definidas corretamente.');

  if($_POST['action']  !== 'user_login')
    throw new Exception('As informações de login não foram definidas corretamente.');
  unset($_POST['action']);

  // Validate inputs
  $email = Valid::Email($_POST['email']);
  $password = Valid::Password($_POST['password']);

  if(!$email)
    throw new Exception('E-mail inválido.');

  if(!$password)
    throw new Exception('Senha inválida');

  $auth = Users::login($_POST['email'], $_POST['password']);
  // error_log('Login :'. $auth);
  echo $auth;
} catch (Exception $e) {
  // error_log('Login Error : '.  $e->getMessage());
  echo json_encode(array('error' => $e->getMessage()));
}
?>
