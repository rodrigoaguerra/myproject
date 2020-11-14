<?php
declare(strict_types=1);
require ABSPATH . 'vendor/autoload.php';
use Respect\Validation\Validator as v;

class Valid
{
  public static function password($password) {
    return true;
    // return v::alpha()->validate($password);
  }

  public static function email($email) {
    return v::email()->validate($email);
  }

  public static function customer($data) {
    $name     = v::alpha('.', ' ')->charset('ISO-8859-1')->validate(preg_replace('/[^A-Za-z ]/', '', $data['name']));
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
