<?php
include_once '../setup.php';
include_once '../../models/Users.php';
include_once '../../models/Validation.php';

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

  // problema na autenticação
  if(isset($auth['error'])){
    throw new Exception($auth['error']);
  }

  if(isset($auth['success'])){
    ['token' => $token, 'user' => $user] = $auth;
    session_start();
    $_SESSION['token'] = $token;
    $_SESSION['login'] = 1;
    $_SESSION['user_type'] = intval($user['type']);
    $_SESSION['user_status'] = $user['status'];
    echo json_encode($auth);
  } else {
    throw new Exception('Erro ao executar o login.');
  }
} catch (Exception $error) {
  error_log('Login Error : '.  $error->getMessage());
  echo json_encode(array('error' => $error->getMessage()));
}
?>
