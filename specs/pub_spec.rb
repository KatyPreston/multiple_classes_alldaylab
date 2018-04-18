require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")
require_relative("../customer")
require_relative("../pub")
require_relative("../food")

class PubTest < MiniTest::Test

   def setup
    drink1 = Drink.new("Beer", 2, 2)
    drink2 = Drink.new("Cider", 3, 2)
    @customer1 = Customer.new("Katy", 20, 5)
    @customer2 = Customer.new("David", 2, 50)
    food1 = Food.new("Nachos", 3, -2)
    food2 = Food.new("Burger", 7, -4)
    @stock= {
      drinks: [drink1, drink2],
      aliments: [food1, food2]
    }
    @pub = Pub.new("The Chanter", @stock)
   end

   def test_name_pub
     assert_equal("The Chanter", @pub.name)
   end

   def test_till_amount
     assert_equal(0, @pub.till)
   end

   def test_pub_drinks
     assert_equal(2, @pub.stock[:drinks].length)
   end

   def test_add_money_to_till
     @pub.add_money(@stock[:drinks][0])
     assert_equal(2, @pub.till)
   end


   def test_check_age__false
     assert_equal(false, @pub.check_age(@customer1))
   end

   def test_check_age__true
     assert_equal(true, @pub.check_age(@customer2))
   end

   def test_check_drunk
     assert_equal(false, @pub.check_drunk(@customer2))
   end

   # def test_drinks_total_value
   #   assert_equal(5, @pub.drinks_value)
   # end
   #
   # def test_aliments_total_value
   #   assert_equal(10, @pub.aliments_value)
   # end
   #


   def test_total_value_stock__drinks
     assert_equal(5, @pub.one_stock(@stock[:drinks]))
   end

   def test_total_value_stock__food
     assert_equal(10, @pub.one_stock(@stock[:aliments]))
   end

   def test_total_value_stock
     assert_equal(15, @pub.stock_value(@stock[:drinks], @stock[:aliments]))
   end

   def test_food_menu
     assert_equal(2, @pub.display_menu(@stock[:aliments]).length)
   end

   def test_drink_menu
     assert_equal(2, @pub.display_menu(@stock[:drinks]).length)
   end

end
