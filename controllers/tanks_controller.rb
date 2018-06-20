require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/tank.rb')
require_relative( '../models/characteristic.rb')
also_reload( '../models/*')

#INDEX
get('/tanks') do
  @tanks = Tank.all()
  erb( :"tanks/index" )
end
# get('/tanks/:id/avaliable') do
#   tank = Tank.find(params[:id] )
#   @tank = Tank.avaliable()
#   erb( :"tanks/index" )
# end
#NEW
get ('/tanks/new') do
  @tanks = Tank.all()
  @characteristics = Characteristic.all()
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
  @characteristics = Characteristic.all
  erb( :"tanks/edit" )
end

#UPDATE
post '/tanks/:id' do
  @tank = Tank.new(params)
  @tank.update
  redirect to '/tanks'
end
#DELETE
post '/tanks/:id/delete' do
  tank = Tank.find(params[:id] )
  tank.tank_avaliable.to_s
  if tank.tank_avaliable
  tank.delete()
  redirect to '/tanks'
else
  erb( :"tanks/no_tank")
end
end
