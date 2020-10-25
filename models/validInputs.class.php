<?php

/**
* Deal with inputs of the user
**/
class ValidInputs {
	private $error;

	function __construct()
	{
		self::$error = NULL;
	}

	private static function testInput($input_value) {
	  $input_value = trim($input_value);
	  $input_value = stripslashes($input_value);
	  $input_value = htmlspecialchars($input_value);
	  return $input_value;
	}

	// Validate firstName
	public static function validFirstName($first_name){
		$firstname = self::testInput($first_name);

  	if(empty($firstname)){
  		return array('error' => "O campo nome está vazio.");
  	}elseif(strlen ($firstname) > 25 ){
  		return array('error' => "O campo nome é maior que o limite permitido de 25 caracteres.");
  	}elseif(!preg_match("/[A-záàâãéèêíïóôõöúçñ]/", $firstname)) {
	 	 	return array('error' => "o campo nome não está em um padrão válido.");
		}

		return $firstname;
	}

	// Validate lastName
	public static function validLastName($last_name){
		$last_name = self::testInput($last_name);

		if(empty($last_name)){
  		return array('error' => "O campo sobrenome está vazio.");
  	}elseif(strlen($last_name) > 30){
  		return array('error' => "O campo sobrenome é maior que o limite permitido de 30 caracteres.");
  	}elseif(!preg_match("/[A-záàâãéèêíïóôõöúçñ ]/", $last_name)) {
		  return array('error' => "O campo sobrenome não está em um padrão válido.");
		}

		return $last_name;
	}

	public static function validEmail($email){
		$error = NULL;

		// Remove all illegal characters from email
		$email = filter_var($email, FILTER_SANITIZE_EMAIL);

		// Validate e-mail
		if(empty($email)){
			return array('error' => "O campo e-mail está vazio.");
		}elseif(strlen($email) > 62){
			return array('error' => "O campo e-mail é maior que o limite permitido de 62 caracteres.");
		}elseif(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
		  return array('error' => "O e-mail : ". $email ." não é um endereço de e-mail válido, por favor, tente outro.");
		}

		return array('success' => $email);
	}

	// Validade password
	public static function validPassword($password){
		$password = self::testInput($password);

		if(empty($password)){
			return array('error' => "O campo senha está vazio.");
		}elseif(strlen($password) > 15){
			return array('error' => "O campo senha é maior que o limite permitido de 15 caracteres.");
		}

		return $password;
	}

	//validate inputs
	public static function validInput($input, $name, $length, $regex){
		$input = self::testInput($input);

		if(empty($input)){
			return array('error' => "O campo ".$name." está vazio.");
		}elseif(strlen($input) > $length){
			return array('error' => "O campo ".$name." é maior que o limite permitido de ".$length." caracteres.");
		}

		if($regex !== NULL){
			if(!preg_match($regex, $input)) {
			  return array('error' => "O campo ".$name." não está em um padrão válido.");
			}
		}

		return $input;
	}

	//validate token
	public static function validToken($input){
		$input = self::testInput($input);
		if(empty($input)){
			return array('error' => "Token is invalid");
		}
		return $input;
	}

}

?>
