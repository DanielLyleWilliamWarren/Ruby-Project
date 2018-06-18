require( 'pry' )
require_relative('../models/tank.rb')
require_relative('../models/rental.rb')
require_relative('../models/customer.rb')

Rental.delete_all()
Tank.delete_all()
Customer.delete_all()

tank1 = Tank.new({
  "name" => "Tiger I",
  "country_of_origin" => "Germany",
  "price" => "1200"
  })

tank2 = Tank.new({
  "name" => "IS",
  "country_of_origin" => "USSR",
  "price" => "1000"
  })

tank3 = Tank.new({
  "name" => "T29",
  "country_of_origin" => "USA",
  "price" => "1000"
  })
tank1.save()
tank2.save()
tank3.save()

customer1 = Customer.new({
  "name" => "Georgy Zhukov"
  })

customer1.save()

rental1 = Rental.new({
  "customer_id" => customer1.id(),
  "tank_id" => tank2.id(),
  "rental_status" => true
  })

rental1.save()

binding.pry
nil
