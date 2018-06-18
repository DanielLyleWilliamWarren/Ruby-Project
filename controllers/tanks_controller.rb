require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/tank.rb')
also_reload( '../models/*')

#INDEX
get('/tanks') do
  @tanks = Tank.all()
  erb( :"tanks/index" )
end

#NEW
get ('/tanks/new') do
  @tanks = Tank.all()
  erb( :"tanks/new" )
end

# get ('/tanks/new') do
#   @customer = Customer.all()
#   erb( :new )
# end

#SHOW
get '/tanks/:id' do
  @tank = Tank.find( params[:id] )
  erb( :show )
end

#CREATE
post ('/tanks') do
  @tank = Tank.new(params)
  @tank.save()
  erb( :create )
end

# post ('/customers') do
#   @customer = Customer.new(params)
#   @customer.save()
#   erb( :create )

#EDIT
# get ('/tanks/:id/edit') do
#   @tank = Tank.find(params[:id])
#   erb( :edit )
# end




# post ('/customers') do
#   @customer = Customer.new(params)
#   @customer.save()
#   erb(  :create  )
# end
