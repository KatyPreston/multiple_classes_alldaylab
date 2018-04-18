require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")
require_relative("../customer")
require_relative("../pub")

class CustomerTest < MiniTest::Test

   def setup
    @drink1 = Drink.new("Beer", 2, 2)
    @drink2 = Drink.new("Cider", 3, 2)
    @pub = Pub.new("The Chanter", [@drink1, @drink2])

    @customer = Customer.new("Luis", 4, 20)
   end

   def test_customer_name
     assert_equal("Luis", @customer.name)
   end


 end
