require_relative('../db/sql_runner')

class Characteristic

  attr_reader :id, :class

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @class = options['class']
  end

  def save()
    sql = "INSERT INTO characteristics
    (
      class
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@class]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def self.delete_all()
    sql = "DELETE from characteristics"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM characteristics
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    characteristic = Characteristic.new(result)
    return characteristic
  end

  def self.all()
    sql = "SELECT * FROM characteristics"
    characteristic_data = SqlRunner.run(sql)
    characteristics = map_items(characteristic_data)
    return characteristics
  end

  def self.map_items(characteristic_data)
    return characteristic_data.map { |characteristic| Characteristic.new(characteristic) }
  end

end
