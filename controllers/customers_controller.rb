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
  @customers = Customer.all()
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

#EDIT
get ('/customers/:id/edit') do
  @customer = Customer.find(params[:id])
  erb( :"customers/edit" )
end

#UPDATE
post '/customers/:id' do
  @customer = Customer.new(params)
  @customer.update
  redirect to '/customers'
end
#DELETE
post '/customers/:id/delete' do # delete
  customer = Customer.find(params[:id] )
  customer.delete()
  redirect to '/customers'
end
