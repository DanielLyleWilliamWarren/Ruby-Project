require_relative('../db/sql_runner')

class Customer

  attr_reader :name, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
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
      @id = customer_data.first()['id'].to_i
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
    sql = "UPDATE customers SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run( sql, values )
  end

  def tanks()
    sql = "SELECT tanks.* FROM tanks
      INNER JOIN rentals
      ON rentals.tank_id = tanks.id
      WHERE customer_id =$1"
    values = [@id]
    tank_data = SqlRunner.run( sql, values )
    return Tank.map_items(tank_data)
  end

  def self.map_items(customer_data)
    result = customer_data.map { |customer| Customer.new( customer ) }
    return result
  end

  def delete()
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.find( id )
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [id]
    customer = SqlRunner.run( sql, values )
    result = Customer.new( customer.first )
    return result
  end



end
