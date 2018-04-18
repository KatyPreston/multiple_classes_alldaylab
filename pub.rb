class Pub

  attr_reader(:name, :till)
  attr_accessor(:stock)

  def initialize(name, stock)
    @name = name
    @till = 0
    @stock = stock
  end

  def add_money(drink)
    @till += drink.price
  end

  def check_age(customer)
    if customer.age >= 18
      return true
    else
      return false
    end
  end

  def check_drunk(customer)
    if customer.drunk_level >= 10
      return true
    else
      return false
    end
  end

  # BEFORE REFACTORING
  # def drinks_value
  #   total = 0
  #   for drink in @stock[:drinks]
  #     total += drink.price
  #   end
  #   return total
  # end
  #
  # def aliments_value
  #   total = 0
  #   for food in @stock[:aliments]
  #     total += food.price
  #   end
  #   return total
  # end
  #
  # def stock_value
  # return total = self.aliments_value + self.drinks_value
  # end
  #

  def one_stock(aliments_or_drinks)
    total= 0
    for food_or_drink in aliments_or_drinks
      total += food_or_drink.price
    end
    return total
  end

  def stock_value(drinks, aliments)
   return total = one_stock(drinks) + one_stock(aliments)
  end

  def display_menu(aliments_or_drinks)
    menu = []
    for food_or_drink in aliments_or_drinks
      menu.unshift("We have a #{food_or_drink.name} for #{food_or_drink.price} pounds")
    end
    return menu
  end

end
