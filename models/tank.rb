require_relative('../db/sql_runner')

class Tank

  attr_reader :name, :country_of_origin, :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @country_of_origin = options['country_of_origin']
  end

  
