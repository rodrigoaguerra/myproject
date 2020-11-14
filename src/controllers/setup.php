<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Authorization, Origin, X-Requested-With, Content-Type, Accept");
$rest_json = file_get_contents("php://input");
$_POST = json_decode($rest_json, true);
//caminho do servidor do sistema
if(!defined('BASEURL')) {
  define('BASEURL', dirname(getcwd(), 3));
}
?>
