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

end
