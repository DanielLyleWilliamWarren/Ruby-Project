require_relative('../db/sql_runner')

class Tank

  attr_reader :name, :country_of_origin, :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @country_of_origin = options['country_of_origin']
  end

  def save()
      sql = "INSERT INTO tanks
      (
        name,
        country_of_origin
      )
      VALUES
      (
        $1, $2
      )
      RETURNING *"
      values = [@name, @country_of_origin]
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

    def update()
      sql = "UPDATE tanks
      SET
      (
      name,
      country_of_origin
      ) =
      (
      $1, $2
      )
      WHERE id = $3"
      values = [@name, @country_of_origin]
      SqlRunner.run( sql, values )
    end

end
