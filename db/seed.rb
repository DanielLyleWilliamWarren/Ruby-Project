require( 'pry' )
require_relative('../models/tank.rb')
require_relative('../models/rental.rb')
require_relative('../models/customer.rb')
require_relative('../models/characteristic.rb')

Rental.delete_all()
Characteristic.delete_all()
Tank.delete_all()
Customer.delete_all()

characteristic1 = Characteristic.new({'class' => 'Light Tank'})
characteristic2 = Characteristic.new({'class' => 'Medium Tank'})
characteristic3 = Characteristic.new({'class' => 'Heavy Tank'})
characteristic4 = Characteristic.new({'class' => 'Tank Destroyer'})

characteristic1.save()
characteristic2.save()
characteristic3.save()
characteristic4.save()

tank1 = Tank.new({
  "name" => "Tiger I",
  "country_of_origin" => "Germany",
  "price" => "1200",
  "characteristic_id" => characteristic3.id(),
  "logo"
  })

tank2 = Tank.new({
  "name" => "IS",
  "country_of_origin" => "USSR",
  "price" => "1000",
  "characteristic_id" => characteristic3.id()
  })

tank3 = Tank.new({
  "name" => "T29",
  "country_of_origin" => "USA",
  "price" => "1000",
  "characteristic_id" => characteristic3.id()
  })

tank4 = Tank.new({
  "name" => "Tiger II",
  "country_of_origin" => "Germany",
  "price" => "1500",
  "characteristic_id" => characteristic3.id()
  })
tank5 = Tank.new({
  "name" => "Jagdtiger",
  "country_of_origin" => "Germany",
  "price" => "1800",
  "characteristic_id" => characteristic4.id()
  })
tank6 = Tank.new({
  "name" => "M18 Hellcat",
  "country_of_origin" => "USA",
  "price" => "650",
  "characteristic_id" => characteristic4.id()
  })
tank7 = Tank.new({
  "name" => "M41 Bulldog",
  "country_of_origin" => "USA",
  "price" => "900",
  "characteristic_id" => characteristic1.id()
  })
tank8 = Tank.new({
  "name" => "Cromwell",
  "country_of_origin" => "UK",
  "price" => "800",
  "characteristic_id" => characteristic2.id()
  })
tank9 = Tank.new({
  "name" => "Churchill Mk V",
  "country_of_origin" => "UK",
  "price" => "550",
  "characteristic_id" => characteristic3.id()
  })
tank10 = Tank.new({
  "name" => "Centurion Mk VII",
  "country_of_origin" => "UK",
  "price" => "550",
  "characteristic_id" => characteristic2.id()
  })
tank11 = Tank.new({
  "name" => "AMX 13 90",
  "country_of_origin" => "France",
  "price" => "950",
  "characteristic_id" => characteristic1.id()
  })
tank12 = Tank.new({
  "name" => "AMX 30t",
  "country_of_origin" => "France",
  "price" => "1250",
  "characteristic_id" => characteristic2.id()
  })
tank13 = Tank.new({
  "name" => "AMX 50 120",
  "country_of_origin" => "France",
  "price" => "1300",
  "characteristic_id" => characteristic3.id()
  })
tank14 = Tank.new({
  "name" => "T-34",
  "country_of_origin" => "USSR",
  "price" => "550",
  "characteristic_id" => characteristic2.id()
  })
tank15 = Tank.new({
  "name" => "T-54",
  "country_of_origin" => "USSR",
  "price" => "1250",
  "characteristic_id" => characteristic3.id()
  })

tank1.save()
tank2.save()
tank3.save()
tank4.save()
tank5.save()
tank6.save()
tank7.save()
tank8.save()
tank9.save()
tank10.save()
tank11.save()
tank12.save()
tank13.save()
tank14.save()
tank15.save()

customer1 = Customer.new({
  "name" => "Georgy Zhukov"
  })
customer2 = Customer.new({
  "name" => "Bernard Montgomery"
  })
customer3 = Customer.new({
  "name" => "Erwin Rommel"
  })
customer4 = Customer.new({
  "name" => "Charles de Galle"
  })
customer5 = Customer.new({
  "name" => "George Patton"
  })

customer1.save()
customer2.save()
customer3.save()
customer4.save()
customer5.save()

rental1 = Rental.new({
  "customer_id" => customer1.id(),
  "tank_id" => tank2.id(),
  "rental_status" => true
  })

rental1.save()

binding.pry
nil
