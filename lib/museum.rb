class Museum
  attr_reader :name, :revenue
  def initialize(name)
    @name     = name
    @exhibits = {}
    @revenue  = 0
  end

  def add_exhibit(name, price)
    @exhibits[name] = price
  end

  def admit(patron)
    @revenue += 10
    patron.interests.map do |interest|
      @revenue += @exhibits[interest] if @exhibits.key?(interest)
    end
  end
end
