<?php

declare(strict_types=1);

include_once BASEURL . '/config.php';
include_once DBAPI;
include_once dirname(__FILE__) . '/Email.php';

class SendEmail
{
	/**
   * Send Email Valid Account
   * @return array<string> 
   */
  public static function validAccount(string $email, string $token): array {
		try {
			if(!$token){
				throw new Exception('Problema ao criar token de acesso ao e-mail.', 1);
      }
      
      $user = Database::select(['id', 'email', 'firstname'], 'users', NULL, 'email', $email);
      ['email' => $user_email, 'firstname' => $user_name ] = $user;

			// Send email for the user validate your acount
			$mail = new Email();
			$from = "contato@rodrigoalvesguerra.com.br";
			$name = "Rodrigo Alves Guerra";
			$subject = "Confirmação de conta";
			$content = "Uma conta foi criada em nosso sistema, com esse endereço de e-mail. Para ativa-la <a href=\"".SYSTEM_URL."/account/valid_acount?cod=${token}\">clique aqui</a>; Isto confirma a utilização desse endereço de e-mail pelo usuário ${user_name}, caso não você não tenha solicitado esse registro apenas ignore esse e-mail. Obrigado!";
			$altcontent = $content;
			$mail->recipients($from, $name, $user_email);
			$mail->content($subject, $content, $altcontent);
			return $mail->send('Usuário registrado, por favor valide seu e-mail.');
		} catch (Exception $error) {
		  return array('error' => $error->getMessage());
		}
  }

  /**
   * Send Email Recover Password
   * @return array<string>
   */
	public static function recoverPassword(string $email, string $token): array {
		try {
			if(!$token){
				throw new Exception('Problema ao criar token de acesso ao e-mail.', 1);
			}
      
      $user = Database::select(['id', 'email', 'firstname'], 'users', NULL, 'email', $email);
			['email' => $user_email, 'firstname' => $user_name ] = $user;

			// Send email for the user validate your acount
			$mail = new Email();
			$from = "contato@rodrigoalvesguerra.com.br";
			$name = "Rodrigo Alves Guerra";
			$subject = "Recuperação de senha";
			$content = "Olá ${user_name}, uma solicitação de recuparação de senha, foi feita no sistema. Para alterar sua senha <a href=\"".SYSTEM_URL."/account/recover?cod=${token}\">clique aqui</a>, caso não você não tenha solicitado esse registro apenas ignore esse e-mail. Obrigado!";
			$altcontent = $content;
			$mail->recipients($from, $name, $user_email);
			$mail->content($subject, $content, $altcontent);
			return $mail->send('Você recebeu um e-mail, para a confirmação de sua conta. Verifique sua caixa de entrada, e clique no link do e-mail para ativar sua conta!');
		} catch (Exception $error) {
		  return array('error' => $error->getMessage());
		}
	}
}
