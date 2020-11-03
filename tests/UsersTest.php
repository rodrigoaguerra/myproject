<?php
declare(strict_types=1);
require_once 'vendor/fzaninotto/faker/src/autoload.php';
require_once 'src/models/Users.php';
use PHPUnit\Framework\TestCase;

// setlocale (LC_ALL, 'pt_BR');
final class UsersTest extends TestCase
{

  public function testLogin(): void {

    $res = Users::login('rodrigoa.guerra@hotmail.com', 'digo123@');

    $this->assertEquals('Cliente registrado com sucesso.', $res['success']);
  }

  // public function testList(): void {
  //   $res = Customers::list();
  //   $this->assertNotEmpty($res);
  // }

  // public function getRand() {
  //   $customers = Customers::list();
  //   $index = array_rand($customers, 1);
  //   $customer = $customers[$index];
  //   return $customer;
  // }

  // public function testEdit(): void {
  //   $customer = $this->getRand();
  //   $customer['name'] = ' Cliente Editado (edit)';
  //   $customer['email'] = 'testcustomer@hotmail.com';
  //   $customer['address']['number'] = '123456';

  //   $res = Customers::edit($customer);

  //   $this->assertEquals('Cliente atualizado com sucesso.', $res['success']);
  // }

  // public function testDelete(): void {
  //   $customer = $this->getRand();
  //   $res = Customers::remove($customer['customer_id']);
  //   $this->assertEquals('Cliente deletado com sucesso.', $res['success']);
  // }
}
