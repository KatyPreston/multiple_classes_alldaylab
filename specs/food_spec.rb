require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")
require_relative("../customer")
require_relative("../pub")
require_relative("../food")

class FoodTest < MiniTest::Test

   def setup
    @drink1 = Drink.new("Beer", 2, 2)
    @drink2 = Drink.new("Cider", 3, 2)
    @drink3 = Drink.new("Cider", 3, 20)
    @pub = Pub.new("The Chanter", [@drink1, @drink2])

    @customer = Customer.new("Luis", 4, 20)
    @customer2 = Customer.new("Vader", 1, 20)
    @food = Food.new("Burger", 7, -4)
   end

   def test_name_food
     assert_equal("Burger", @food.name)
   end
 end
