require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")
require_relative("../customer")
require_relative("../pub")
require_relative("../food")

class DrinkTest < MiniTest::Test

   def setup
    @drink = Drink.new("Beer", 2, 2)
   end

   def test_name_drink
     assert_equal("Beer", @drink.name)
   end


end
