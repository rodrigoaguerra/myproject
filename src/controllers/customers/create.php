<?php
header("Access-Control-Allow-Origin: *");
$rest_json = file_get_contents("php://input");
$_POST = json_decode($rest_json, true);
require('vendor/autoload.php');
use Respect\Validation\Validator as v;

$name = "John Doe";

$r = v::alnum()->validate($name);

if ($r) {

  echo "Validation passed";
} else {

    echo "Validation failed";
}
?>
