<?php
declare(strict_types=1);
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


  // public function testCanBeCreatedFromValidEmailAddress(): void
  // {
  //   $this->assertInstanceOf(
  //     Email::class,
  //     Email::fromString('user@example.com')
  //   );
  // }

  // public function testCannotBeCreatedFromInvalidEmailAddress(): void
  // {
  //   $this->expectException(InvalidArgumentException::class);
  //   Email::fromString('invalid');
  // }

  // public function testCanBeUsedAsString(): void
  // {
  //   $this->assertEquals(
  //     'user@example.com',
  //     Email::fromString('user@example.com')
  //   );
  // }
}
