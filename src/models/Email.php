<?php
require(ABSPATH . 'vendor/autoload.php');
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

/**
* Enviando email com PHPMailer
**/
class Email{
  private $mail;

  public function __construct(){
  	$this->mail = new PHPMailer(true); 					// Passing `true` enables exceptions
  	try {
			/**
			 * Server Settings
			 */
			//$mail->SMTPDebug = 2;                   // Enable verbose debug output
			$this->mail->isSMTP();                    // Set mailer to use SMTP
			$this->mail->Host 			= SMTP_HOST;      // Specify main and backup SMTP servers
			$this->mail->SMTPAuth 	= SMTP_AUTH;      // Enable SMTP authentication
			$this->mail->Username 	= SMTP_USERNAME;  // SMTP username
			$this->mail->Password 	= SMTP_PASSWORD;  // SMTP password
			$this->mail->SMTPSecure = SMTP_SECURE;    // Enable TLS encryption, `ssl` also accepted
			$this->mail->Port 			= SMTP_PORT;      // TCP port to connect to

    } catch (Exception $e) {
			//echo 'Message could not be sent.';
			error_log('Mailer Error: ' . $this->mail->ErrorInfo);
	    return json_encode(array('error' => 'Mailer Error: ' . $this->mail->ErrorInfo)) ;
	  }
  }

  public function recipients($from, $name, $email_address){
		try {
	  	//Recipients
	    $this->mail->setFrom($from, $name);
	    $this->mail->addAddress($email_address);     // Add a recipient
	    //$this->mail->addAddress('ellen@example.com');// Name is optional
	    //$this->mail->addReplyTo('contato@rodrigoalvesguerra.com.br', 'WorkSystem');
	    //$this->mail->addCC('cc@example.com');
	    //$this->mail->addBCC('bcc@example.com');
	  } catch (Exception $e) {
			//echo 'Message could not be sent.';
			error_log('Mailer Error: ' . $this->mail->ErrorInfo);
	    return json_encode(array('error' => 'Mailer Error: ' . $this->mail->ErrorInfo)) ;
	  }
  }

  public function attachments($file_name, $name){
		try {
    	//Attachments
    	$this->mail->addAttachment($file_name, $name); // Add attachments
    	//error_log($file_name);
 	    //$this->mail->addAttachment('/tmp/image.jpg', 'new.jpg');// Optional name
	  } catch (Exception $e) {
			//echo 'Message could not be sent.';
			error_log('Mailer Error: ' . $this->mail->ErrorInfo);
	    return json_encode(array('error' => 'Mailer Error: ' . $this->mail->ErrorInfo)) ;
	  }
  }

  public function content($subject, $content, $altcontent){
		try {
    	//Content
	    $this->mail->isHTML(true);                                  // Set email format to HTML
	    $this->mail->CharSet = "UTF-8"; // Charset da mensagem (opcional)
	    $this->mail->Subject = $subject;
	    $this->mail->Body  = $content;

	    $this->mail->AltBody = $altcontent;
	  } catch (Exception $e) {
			error_log('Mailer Error: ' . $this->mail->ErrorInfo);
	    return json_encode(array('error' => 'Mailer Error: ' . $this->mail->ErrorInfo)) ;
	  }
  }

  public function send($message){
  	try{
  		$this->mail->send();
  		return json_encode(array('success' => $message));
  	} catch (Exception $e) {
			//echo 'Message could not be sent.';
			error_log('Mailer Error: ' . $this->mail->ErrorInfo);
    	return json_encode(array('error' => 'Mailer Error: ' . $this->mail->ErrorInfo)) ;
  	}
  }
}

?>
