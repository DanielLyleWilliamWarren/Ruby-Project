require_relative('../db/sql_runner')

class Rental

  attr_reader :id, :tank_id, :customer_id, :rental_status

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @tank_id = options['tank_id'].to_i
    @customer_id = options['customer_id'].to_i
    @rental_status = options['rental_status']
  end

  def save()
      sql = "INSERT INTO rentals
      (
        customer_id,
        tank_id,
        rental_status
      )
      VALUES
      (
        $1, $2, $3
      )
      RETURNING *"
      values = [@customer_id, @tank_id, @rental_status]
      rental_data = SqlRunner.run(sql, values)
      @id =   rental_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM rentals"
    rentals = SqlRunner.run( sql )
    result = rentals.map { |rental| Rental.new( rental ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE from rentals"
    SqlRunner.run(sql)
  end

  def delete()
  sql = "DELETE FROM rentals
  WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )
end

def customer()
  sql = "SELECT *
  FROM customers
  WHERE id = $1"
  values = [@customer_id]
  customer = SqlRunner.run(sql, values).first
  return Customer.new(customer)
end

def update()
  sql = "UPDATE rentals SET rental_status = $1 WHERE id = $2"
  values = [@rental_status, @id]
  SqlRunner.run( sql, values )
end

def tank()
  sql = "SELECT *
  FROM tanks
  WHERE id = $1"
  values = [@tank_id]
  tank = SqlRunner.run(sql, values).first
  return Tank.new(tank)
end

def self.map_items(rental_data)
  result = rental_data.map { |rental| Rental.new( rental ) }
  return result
end

def self.find( id )
  sql = "SELECT * FROM rentals
  WHERE id = $1"
  values = [id]
  rental = SqlRunner.run( sql, values )
  result = Rental.new( rental.first )
return result

end

  # def assign_tank()
  #   sql = 'SELECT name FROM tanks WHERE id = $1'
  #   values = [@tank_id]
  #   tank = SqlRunner.run(sql, values)
  #   return tank[0]["name"]
  # end

end
