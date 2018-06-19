require_relative('../db/sql_runner')

class Tank

  attr_reader :name, :country_of_origin, :id, :price

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @country_of_origin = options['country_of_origin']
    @price = options['price'].to_i
  end

  def save()
      sql = "INSERT INTO tanks
      (
        name,
        country_of_origin,
        price
      )
      VALUES
      (
        $1, $2, $3
      )
      RETURNING *"
      values = [@name, @country_of_origin, @price]
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
      price
      ) =
      (
      $1, $2, $3
      )
      WHERE id = $4"
      values = [@name, @country_of_origin, @price, @id]
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

end
