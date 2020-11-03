<?php
  include_once('src/model/users.class.php');
  include_once('src/model/validInputs.class.php');

  if($_POST['action'] === 'send_valid_email'){
    unset($_POST['action']);

    /**
    * Deal with inputs of the user
    **/
    // Validate email
    $_POST['email'] = ValidInputs::validEmail($_POST['email']);

    if(isset($_POST['email']['error'])){
      $error = json_encode($_POST['email']['error']);
    }

    if(!isset($error)){
      // register user acount
      $data = Users::send_valid_email($_POST['email']);

      // check if email has already been registered.
      if(isset($data['error'])){
        echo json_encode($data);
      }
    }else{
      echo $error;
    }
  }else{
    echo json_encode(array('error' => 'Informações do usuário não foram definidas corretamente.'));
  }
?>
