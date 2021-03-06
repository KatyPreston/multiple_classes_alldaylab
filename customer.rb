class Customer

  attr_reader(:name, :age)
  attr_accessor(:wallet, :drunk_level)

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunk_level = 0
  end

  def add_drunk(drink)
    @drunk_level += drink.alcohol_level
  end

  def can_afford(drink)
    if @wallet >= drink.price
      return true
    else
      return false
    end
  end

  def subtract(drink)
    @wallet -= drink.price
  end

  def buy_drink(pub, drink)
    return if pub.check_drunk(self)
    if can_afford(drink) && pub.check_age(self)
      subtract(drink)
      add_drunk(drink)
      pub.add_money(drink)
    end
  end

  def add_rejuvenation(food)
    @drunk_level += food.rejuvenation
  end

  def buy_food(pub, food)
    if can_afford(food)
      subtract(food)
      add_rejuvenation(food)
      pub.add_money(food)
    end
  end

end
