require("minitest/autorun")
require_relative("../customer.rb")

class TestCustomer < MiniTest::Test

  def setup
    options = { "name" => "Georgy Zhukov"}

    @customer = Customer.new(options)

  end

def test_name
result = @customer.name()
assert_equal("Georgy Zhukov", result)
end

end
