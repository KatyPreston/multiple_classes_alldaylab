require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")
require_relative("../customer")
require_relative("../pub")

class PubTest < MiniTest::Test

   def setup
    @drink1 = Drink.new("Beer", 2, 2)
    @drink2 = Drink.new("Cider", 3, 2)
    @pub = Pub.new("The Chanter", [@drink1, @drink2])
    @customer1 = Customer.new("Katy", 20, 5)
    @customer2 = Customer.new("David", 2, 50)
   end

   def test_name_pub
     assert_equal("The Chanter", @pub.name)
   end

   def test_till_amount
     assert_equal(0, @pub.till)
   end

   def test_pub_drinks
     assert_equal(2, @pub.drinks.length)
   end

   def test_add_money_to_till
     @pub.add_money(@drink1)
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


end
