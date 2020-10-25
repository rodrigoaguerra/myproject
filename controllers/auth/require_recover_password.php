<?php
  include_once('../../model/users.class.php');
  include_once('../../model/email.class.php');
  include_once('../../model/validInputs.class.php');

  if($_POST['action'] === 'require_recover_password'){
  	unset($_POST['action']);
  	/**
  	* Deal with inputs of the user
  	**/
  	// Validate email
  	$valid = ValidInputs::validEmail($_POST['email']);
		if(!isset($valid['error'])){
			// register user acount
			$data = Users::requireRecoverPassword($_POST['email']);
			// check if email has already been registered.
			if(!isset($data['error'])){
				// Send email for the user validate your acount
				$mail = new Email();
				$from = "contato@rodrigoalvesguerra.com.br";
				$name = "Coleta Produtos";
				$email_address = $_POST['email'];
				$subject = "Recuperação de senha";
				$content = "Olá ".$data['name'].", uma solicitação para recuperação de sua senha foi solicitada em nosso sistema com esse e-mail. Para redefinir sua senha <a href=\"https://www.rodrigoalvesguerra.com.br/coleta-produtos/dashboard/account/recover?recoveryToken=" .$data['hash']. "\">clique aqui</a>. Caso não você não tenha solicitado essa alteração apenas ignore esse e-mail. Obrigado!";
				$altcontent = $content;
				$mail->recipients($from, $name, $email_address);
				$mail->content($subject, $content, $altcontent);
				echo $mail->send('Você recebeu um e-mail, para a recuperação de senha. Verifique sua caixa de entrada, e clique no link do e-mail para redefinir sua senha');
			}else{
				echo json_encode(array('error' => $data['error']));
			}
		}else{
			echo json_encode(array('error' => $error));
		}
  }else{
  	echo json_encode(array('error' => 'A informação de recuperação de senha não foram definidas corretamente.'));
  }
?>
