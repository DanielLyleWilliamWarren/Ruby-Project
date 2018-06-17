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
