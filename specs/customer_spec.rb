require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")
require_relative("../customer")
require_relative("../pub")
require_relative("../food")

class CustomerTest < MiniTest::Test

   def setup
    drink1 = Drink.new("Beer", 2, 2)
    drink2 = Drink.new("Cider", 3, 2)
    drink3 = Drink.new("Cider", 3, 20)
    @customer = Customer.new("Luis", 4, 20)
    @customer2 = Customer.new("Vader", 1, 20)
    food1 = Food.new("Nachos", 3, -2)
    food2 = Food.new("Burger", 7, -4)
    @stock= {
      drinks: [drink1, drink2, drink3],
      aliments: [food1, food2]
    }
    @pub = Pub.new("The Chanter", @stock)
   end

   def test_customer_name
     assert_equal("Luis", @customer.name)
   end

   def test_add_drunk
     @customer.add_drunk(@stock[:drinks][0])
     assert_equal(2, @customer.drunk_level)
   end

   def test_afford_drink__true
     assert_equal(true, @customer.can_afford(@stock[:drinks][0]))
   end

   def test_afford_drink__false
     assert_equal(false, @customer2.can_afford(@stock[:drinks][0]))
   end

   def test_subtract_wallet
     @customer.subtract(@stock[:drinks][0])
     assert_equal(2, @customer.wallet)
   end

   def test_subtract_wallet__more
     @customer.subtract(@stock[:drinks][1])
     assert_equal(1, @customer.wallet)
   end

   def test_buy_drink__positive
     @customer.buy_drink(@pub, @stock[:drinks][0])
     assert_equal(2, @customer.wallet)
     assert_equal(2, @customer.drunk_level)
     assert_equal(2, @pub.till)
   end

   def test_buy_drink__false
     @customer2.buy_drink(@pub, @stock[:drinks][0])
     assert_equal(1, @customer2.wallet)
     assert_equal(0, @customer2.drunk_level)
     assert_equal(0, @pub.till)
   end

   def test_customer_drunk
     @customer.add_drunk(@stock[:drinks][2])
     @customer.buy_drink(@pub, @stock[:drinks][0])
     assert_equal(4, @customer.wallet)
     assert_equal(20, @customer.drunk_level)
     assert_equal(0, @pub.till)
   end

   def test_add_rejuvenation
     @customer.add_rejuvenation(@stock[:aliments][0])
     assert_equal(-2, @customer.drunk_level)
   end

   def test_buy_food__true
     @customer.buy_food(@pub, @stock[:aliments][0])
     assert_equal(1, @customer.wallet)
     assert_equal(-2, @customer.drunk_level)
     assert_equal(3, @pub.till)
   end

   def test_buy_food__false
     @customer.buy_food(@pub, @stock[:aliments][1])
     assert_equal(4, @customer.wallet)
     assert_equal(0, @customer.drunk_level)
     assert_equal(0, @pub.till)
   end

 end
