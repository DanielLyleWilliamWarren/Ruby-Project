require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/customers_controller.rb')
require_relative('controllers/tanks_controller.rb')

get '/home' do
  erb( :index )
end
