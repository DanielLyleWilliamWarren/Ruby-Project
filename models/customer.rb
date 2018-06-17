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

end
