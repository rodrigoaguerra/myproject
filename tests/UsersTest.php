<?php
declare(strict_types=1);
require_once 'vendor/fzaninotto/faker/src/autoload.php';
require_once 'src/models/Users.php';
use PHPUnit\Framework\TestCase;

final class UsersTest extends TestCase
{
  // test create user
  public function testCreate() {
    $faker = Faker\Factory::create('pt_BR');

    $user = array(
      'firstname' => $faker->firstName,
      'lastname'  => $faker->lastName,
      'email'     => $faker->email,
      'password'  => $faker->password,
    );

    $res = Users::create($user);
    $this->assertEquals('Usuário registrado, por favor valide seu e-mail.', $res['success']);

    return $user;
  }

	/**
   * @depends testCreate
   */
	public function testValidAccount(array $user) {
		// get user id
		['id' => $user_id ] = Database::select(['id'], 'users', NULL, 'email', $user['email']);
		// get token valid email
    ['token' => $token] = Database::select(['token'], 'tokens', NULL, 'user_id', $user_id);
    $res = Users::validAccount($token);
		$this->assertEquals($user['email'], $res['success']);
	}

  public function testLogin() {
    $res = Users::login('rodrigoa.guerra@hotmail.com', 'zzbsow17');
    $this->assertEquals('usuário autorizado', $res['success']);
    $this->assertNotEmpty($res['user']);
    $this->assertTrue(isset($res['token']));
    $token = $res['token'];
    return $token;
  }

  /**
   * @depends testLogin
   */
  public function testAuth(string $token) {
    $status = Users::Auth($token);
    $this->assertTrue($status);
  }

  public function testList(): void {
    $res = Users::list();
    $this->assertEquals('Lista de usuários', $res['success']);
    $this->assertNotEmpty($res['users']);
  }

	/**
	 * @depends testLogin
	 */
	public function testRequireRecoverPassword(string $token) {
		// get user id
		['user_id' => $user_id ] = Database::select(['user_id'], 'tokens', NULL, 'token', $token);
		// get token valid email
		['email' => $email] = Database::select(['email'], 'users', NULL, 'id', $user_id);
		$res = Users::requireRecoverPassword($email);
		$this->assertEquals('Recuperação de senha solicitada, verifique seu e-mail.', $res['success']);
		return $user_id;
	}

	/**
	 * @depends testRequireRecoverPassword
	 */
	public function testRecoverPassword(string $user_id) {
		$tokens = Database::select(['token', 'action'], 'tokens', NULL, 'user_id', $user_id);
		$tokens = array_filter($tokens, fn($token) => $token['action'] === 'recoverpass');
		$token = array_pop($tokens);
		$res = Users::recoverPassword($token['token'], 'zzbsow17');
	  $this->assertEquals('Sua senha foi redefinida com sucesso.', $res['success']);
	}

	/**
   * @depends testLogin
   */
	public function testLogout(string $token): void {
		$res = Users::logout($token);
    $this->assertEquals(true, $res['success']);
	}
}
?>
