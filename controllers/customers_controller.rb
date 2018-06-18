require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/customer.rb')
also_reload( '../models/*')

get('/customers') do
  @customers = Customer.all()
  erb( :"customers/index" )
end

#NEW
get ('/customers/new') do
  @customers = Customers.all()
  erb( :"customers/new" )
end

#SHOW
get '/customers/:id' do
  @customer = Customer.find( params[:id] )
  erb( :"customers/show" )
end

#CREATE
post ('/customers') do
  @customer = Customer.new(params)
  @customer.save()
  erb( :"customers/create" )
end
