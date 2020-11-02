<?php
/**
 * simple method to encrypt or decrypt a plain text string
 * initialization vector(IV) has to be the same when encrypting and decrypting
 *
 * by: https://gist.github.com/joashp/a1ae9cb30fa533f4ad94
 *
 * @param string $action: can be 'encrypt' or 'decrypt'
 * @param string $string: string to encrypt or decrypt
 *
 * @return string
 */
class Crypt{

  protected static $encrypt_method = "AES-256-CBC";
  protected static $secret_key = 'uns nos fazem cair';
  protected static $secret_iv = 'outros nos fazem levantar';

  /**
  * Make hash secret_key
  **/
  private static function getKey(){
    return hash('sha256', self::$secret_key);
  }

  /**
  * iv - encrypt method AES-256-CBC expects 16 bytes
  * else you will get a warning
  **/
  private static function getIv(){
    return substr(hash('sha256', self::$secret_iv), 0, 16);
  }

  /**
  * @param string $string: string to encrypt
  **/
  public static function encrypt($string) {

    $key = self::getKey();
    $iv = self::getIv();

    $output = openssl_encrypt($string, self::$encrypt_method, $key, 0, $iv);
    $output = base64_encode($output);

    return $output;
  }

  /**
  * @param string $string: string to decrypt
  **/
  public static function decrypt($string) {

    $key = self::getkey();
    $iv = self::getIv();

    $output = openssl_decrypt(base64_decode($string), self::$encrypt_method, $key, 0, $iv);

    return $output;
  }

  /**
  *  Create a token of access
  **/
  public static function createToken(){
    $bytes = openssl_random_pseudo_bytes(25, $cstrong);
    $token = bin2hex($bytes);
    if($cstrong){
      return $token;
    }else{
      return NULL;
    }
  }
}
?>
