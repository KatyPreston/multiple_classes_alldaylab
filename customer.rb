class Customer

  attr_reader(:name, :age)
  attr_accessor(:wallet, :drunk_level)

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunk_level = 0
  end

end
