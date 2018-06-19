require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/tank.rb')
require_relative( '../models/customer.rb')
require_relative( '../models/rental.rb')
also_reload( '../models/*')

#INDEX
get('/rentals') do
  @rentals = Rental.all()
  @tanks = Tank.all()
  @customers = Customer.all()
  erb( :"rentals/index" )
end

#NEW
get ('/rentals/new') do
  @rentals = Rental.all()
  @tanks = Tank.all()
  @customers = Customer.all()
  erb( :"rentals/new" )
end

#SHOW
get '/rentals/:id' do
  @rental = Rental.find( params[:id] )
  erb( :"rentals/show" )
end

#CREATE
post ('/rentals') do
  @rental = Rental.new(params)
  @rental.save()
  erb( :"rentals/create" )
end

#EDIT
get ('/rentals/:id/edit') do
  @rental = Rental.find(params[:id])
  erb( :"rentals/edit" )
end

#UPDATE
post '/rentals/:id' do
  @rental = Rental.find( params[:id] )
  @rental.update
  redirect to '/rentals'
end

#DELETE
post '/rentals/:id/delete' do
  @rental = Rental.find(params[:id] )
  @rental.delete()
  redirect to '/rentals'
end
