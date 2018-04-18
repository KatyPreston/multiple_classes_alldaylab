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

  def drinks_value
    total = 0
    for drink in @stock[:drinks]
      total += drink.price
    end
    return total
  end

end
