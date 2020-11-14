<?php
declare(strict_types=1);
//caminho do servidor do sistema
if(!defined('BASEURL')) {
  define('BASEURL', getcwd());
}
require_once 'vendor/fzaninotto/faker/src/autoload.php';
require_once 'src/models/Customers.php';
use PHPUnit\Framework\TestCase;

final class CustomersTest extends TestCase
{

  public function testCreate(): void {
    $faker = Faker\Factory::create('pt_BR');
    $customer = array(
      'name' => $faker->name,
      'birthdate' => $faker->dateTimeThisCentury->format('Y-m-d'),
      'email' => $faker->email,
      'phone' => $faker->cellphoneNumber,
      'doc' => $faker->cnpj,
      'address' => array(
        'zip_code' => $faker->postcode,
        'street' => $faker->streetName,
        'number' => $faker->buildingNumber,
        'city' => $faker->city,
        'hood' => $faker->citySuffix,
        'state' => $faker->state,
        'country' => $faker->country,
      ),
    );

    $res = Customers::create($customer);

    $this->assertEquals('Cliente registrado com sucesso.', $res['success']);
  }

  public function testList(): void {
    $res = Customers::list();
    $this->assertNotEmpty($res);
  }

  public function getRand() {
    $customers = Customers::list();
    $index = array_rand($customers, 1);
    $customer = $customers[$index];
    return $customer;
  }

  public function testEdit(): void {
    $customer = $this->getRand();
    $customer['name'] = ' Cliente Editado (edit)';
    $customer['email'] = 'testcustomer@hotmail.com';
    $customer['address']['number'] = '123456';

    $res = Customers::edit($customer);

    $this->assertEquals('Cliente atualizado com sucesso.', $res['success']);
  }

  public function testDelete(): void {
    $customer = $this->getRand();
    $res = Customers::remove($customer['customer_id']);
    $this->assertEquals('Cliente deletado com sucesso.', $res['success']);
  }
}
