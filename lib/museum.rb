class Museum
  attr_reader :name, :revenue
  def initialize(name)
    @name     = name
    @exhibits = {}
    @revenue  = 0
    @patrons  = []
  end

  def add_exhibit(name, price)
    @exhibits[name] = price
  end

  def admit(patron)
    @patrons << patron.name
    @revenue += 10
    patron.interests.map do |interest|
      @revenue += @exhibits[interest] if @exhibits.key?(interest)
    end
  end

  def patrons_of(exhibit)
    @patrons
  end
end
