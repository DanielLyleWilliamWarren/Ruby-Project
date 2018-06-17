require("minitest/autorun")
require_relative("../rental.rb")

class TestRental< MiniTest::Test

  def setup
    options = { "tank_id" => "tank_id".to_i,
              "customer_id" => "customer_id".to_i}

    @rental = Rental.new(options)

  end

def test_tank_id
result = @rental.tank_id()
assert_equal("tank_id".to_i, result)
end

def test_customer_id
result = @rental.customer_id()
assert_equal("customer_id".to_i, result)
end

end
