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


get('/tanks/:id/avaliable') do
  tank = Tank.find(params[:id] )
  @tank = Tank.avaliable()
  erb( :"tanks/index" )
end
#NEW
get ('/tanks/new') do
  @tanks = Tank.all()
  erb( :"tanks/new" )
end

get '/tanks/new' do
  @characteristics = Characteristic.all
  erb(:new)
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
  erb( :"tanks/edit" )
end

#UPDATE
post '/tanks/:id' do
  @tank = Tank.new(params)
  @tank.update
  redirect to '/tanks'
end
#DELETE
post '/tanks/:id/delete' do # delete
  tank = Tank.find(params[:id] )
  tank.delete()
  redirect to '/tanks'
end
