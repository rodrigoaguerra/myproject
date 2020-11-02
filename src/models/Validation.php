<?php
require('vendor/autoload.php');
use Respect\Validation\Validator as v;

class Valid
{

  public static function customer($data) {
    $name     = v::alnum(' ', '.')->validate($data['name']);
    $birthdate = v::date('Y-m-d')->validate($data['birthdate']);
    $email    = v::email()->validate($data['email']);
    $phone    = v::digit('(', ')', ' ', '-')->validate($data['phone']);
    $doc      = v::digit('.', '-', '/')->validate($data['doc']);

    if(!$name) {
      error_log('Error : Customer name: '. $data['name']);
      return false;
    }
    if(!$birthdate){
      error_log('Error : Customer birthdate: '. print_r($data['birthdate']));
      return false;
    }
    if(!$email){
      error_log('Error : Customer email: '. $data['email']);
      return false;
    }
    if(!$phone){
      error_log('Error : Customer phone: '. $data['phone']);
      return false;
    }
    if(!$doc){
     error_log('Error : Customer doc: '. $data['doc']);
     return false;
    }

    return true;
  }

}
?>
