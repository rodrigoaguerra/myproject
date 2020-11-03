<?php
include_once('src/model/users.class.php');
include_once('src/model/validInputs.class.php');

if(isset($_GET['cod'])){
	$cod = validInputs::validInput($_GET['cod'], 'cod', 60, NULL);

	$answer = Users::validEmail($cod);
	if($answer != NULL){
		echo 'O e-mail "'. $answer .'" foi válidado com sucesso.';
	}else{
		echo 'Desculpe, tivemos um problema com sua validação de seu e-mail.';
	}
}else{
	header('login.php');
}

?>
