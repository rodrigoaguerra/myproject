<?php
	/**
	 * # Define dir:
	 **/
	//caminho da pasta do sistema
	if(!defined('ABSPATH'))
		define('ABSPATH', dirname(__FILE__) . '/');

	//caminho do servidor do sistema
	if(!defined('BASEURL'))
		define('BASEURL', 'dashboard/');

	//caminho do arquivo de banco de dados
	if(!defined('DBAPI'))
		define('DBAPI', ABSPATH . 'models/db.class.php');

	if(!defined('UPLOAD_DIR'))
		define('UPLOAD_DIR',  ABSPATH .'uploads/');

	/**
	 * # Define data connect database:
	 **/
	define('DB_HOST', 'localhost');			  		// DATABASE hostname
	define('DB_NAME', 'mysystem');      				// DATABASE name
	define('DB_USER', 'root');  						  // DATABASE username
	define('DB_PASSWORD', 'digo123@');		  	// DATABASE password

	/**
	 * # Define data SMTP:
	 **/
	define('SMTP_HOST', 'smtp.hostinger.com.br');                   // SMTP hostname
	define('SMTP_USERNAME', 'contato@rodrigoalvesguerra.com.br');   // SMTP username
	define('SMTP_PASSWORD', 'ord1576@asd');						   					  // SMTP password
	define('SMTP_AUTH', true); 																			// Enable SMTP authentication
	define('SMTP_SECURE', 'tls'); 			    												// Enable TLS encryption, `ssl` also accepted
	define('SMTP_PORT', 587);

	/**
	 *	Path template
	 **/
	define('HEADER_TEMPLATE', ABSPATH . 'includes/header.php');
	define('FOOTER_TEMPLATE', ABSPATH . 'includes/footer.php');

	/**
	 * define DEBUG
	 */
	define('DEBUG', true);
	define('DEBUG_LOG', true);
	define('DEBUG_DISPLAY', true);
?>
