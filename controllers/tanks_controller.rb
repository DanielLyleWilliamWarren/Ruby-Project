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

#SHOW
get '/tanks/:id' do
  @tank = Tank.find( params[:id] )
  erb( :"tanks/show" )
end

#CREATE
post ('/tanks') do
  @tank = Tank.new(params)
  @tank.save()
  erb( :"tanks/create" )
end

#EDIT
get ('/tanks/:id/edit') do
  @tank = Tank.find(params[:id])
  erb( :edit )
end
