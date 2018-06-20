require_relative('../db/sql_runner')
require( 'pry')

class Tank

  attr_accessor :name, :price, :characteristic_id, :country_of_origin
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @country_of_origin = options['country_of_origin']
    @price = options['price'].to_i
    @characteristic_id = options['characteristic_id'].to_i
  end

  def save()
      sql = "INSERT INTO tanks
      (
        name,
        country_of_origin,
        price,
        characteristic_id
      )
      VALUES
      (
        $1, $2, $3, $4
      )
      RETURNING *"
      values = [@name, @country_of_origin, @price, @characteristic_id]
      tank_data = SqlRunner.run(sql, values)
      @id =   tank_data.first()['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM tanks"
      tanks = SqlRunner.run( sql )
      result = tanks.map { |tank| Tank.new( tank ) }
      return result
    end

    def self.delete_all()
      sql = "DELETE from tanks"
      SqlRunner.run(sql)
    end

    def delete()
      sql = "DELETE FROM tanks
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
    end

    def update()
      sql = "UPDATE tanks
      SET
      (
      name,
      country_of_origin,
      price,
      characteristic_id
      ) =
      (
      $1, $2, $3, $4
      )
      WHERE id = $5"
      values = [@name, @country_of_origin, @price, @characteristic_id, @id]
      SqlRunner.run( sql, values )
    end

    def customer()
      sql = "SELECT customers.* FROM customers
      INNER JOIN rentals
      ON rentals.customer_id = customers.id
      WHERE tank_id = $1"
      values = [@id]
      customer_data = SqlRunner.run(sql, values)
      return Customer.map_items(customer_data)
    end

    def self.map_items(tank_data)
      result = tank_data.map { |tank| Tank.new( tank ) }
      return result
    end

    def self.find( id )
      sql = "SELECT * FROM tanks
      WHERE id = $1"
      values = [id]
      tank = SqlRunner.run( sql, values )
      result = Tank.new( tank.first )
    return result
end

  def tank_avaliable()
    # sql = "SELECT rental_status FROM rentals WHERE rentals.tank_id = $1"
    # values = [@id]
    # result = SqlRunner.run( sql, values ).first
    # return false if result == nil
    # returned_result = result["returned"]
    #   if returned_result == "f"
    #     return true
    #       else
    #         return false
    #   end

    sql = "SELECT COUNT(tank_id) FROM rentals WHERE tank_id = $1"
    values = [@id]
    result = SqlRunner.run( sql, values ).first
    return result["count"] == '0'
  end

def class()
  sql = 'SELECT class FROM characteristics WHERE id = $1'
  values = [@characteristic_id]
  characteristic = SqlRunner.run(sql, values)
  return characteristic[0]["class"]
end

end
