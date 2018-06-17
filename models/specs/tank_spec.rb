require("minitest/autorun")
require_relative("../tank.rb")

class TestTank < MiniTest::Test

  def setup
    options = { "name" => "Tiger 1",
                "country_of_origin" => "Germany"}

    @tank = Tank.new(options)

  end

def test_name
result = @tank.name()
assert_equal("Tiger 1", result)
end

def test_country_of_origin
result = @tank.country_of_origin
assert_equal("Germany", result)
end

end
