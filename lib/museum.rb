class Museum
  attr_reader :name
  def initialize(name)
    @name = name
    @exhibits = {}
  end

  def add_exhibit(name, price)
    @exhibits[name] = price
  end
end
