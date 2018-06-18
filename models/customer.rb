require_relative('../db/sql_runner')

class Customer

  attr_reader :name, :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO customers
          (
    name
    )
          VALUES
      (
        $1
      )
      RETURNING *"
      values = [@name]
      customer_data = SqlRunner.run(sql, values)
      @id =   customer_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run( sql )
    result = customers.map { |customer| Customer.new( customer ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE from customers"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE customer
    SET
    (
    name
    ) =
    (
    $1
    )
    WHERE id = $2"
    values = [@name]
    SqlRunner.run( sql, values )
  end

  def tanks()
    sql = "SELECT tanks.* FROM tanks
    INNER JOIN rentals ON
    rentals.tank_id = tank.id WHERE customer_id = $1"
    values = [@id]
    tank_data = SqlRunner.run( sql, values )
    return Tank.map_items(tank_data)
  end

  def self.map_items(customer_data)
    result = customer_data.map { |customer| Customer.new( customer ) }
    return result
  end


end
