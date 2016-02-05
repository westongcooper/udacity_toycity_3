class Customer
  attr_accessor :name
  @@all = []

  def initialize customer
    @name = customer[:name]
    @@all << customer
  end

  def self.all
    @@all
  end
end