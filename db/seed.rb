require( 'pry' )
require_relative('../models/tank.rb')
require_relative('../models/rental.rb')
require_relative('../models/customer.rb')

tank1 = Tank.new({
  "name" => "Tiger I",
  "country_of_origin" => "Germany"
  })

tank2 = Tank.new({
  "name" => "IS",
  "country_of_origin" => "USSR"
  })

tank3 = Tank.new({
  "name" => "T29",
  "country_of_origin" => "USA"
  })

customer1 = Customer.new({
  "name" = "Georgy Zhukov"
  })

rental1 = Rental.new({
  "customer_id" => customer1.id(),
  "tank_id" => tank2.id(),
  "rental_status" => "true"
  })
