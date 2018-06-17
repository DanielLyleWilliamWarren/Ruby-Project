require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/tank.rb')
require_relative( './models/customer.rb')
require_relative( './models/rental.rb')
also_reload( './models/*')

#INDEX
get('/tanks') do
  @tanks = Tank.all()
  erb( :index )
end

#NEW
get ('/new-entry/new') do
  @tanks = Tank.all()
  erb( :new )
end

get ('/new-entry/new') do
  @customer = Customer.all()
  erb( :new )
end

#CREATE
post ('/tanks') do
  @tank = Tank.new(params)
  @tank.save()
  erb(  :create  )
end

post ('/customers') do
  @customer = Customer.new(params)
  @customer.save()
  erb(  :create  )
end
