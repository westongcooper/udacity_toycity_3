class Product
  attr_accessor :title, :price, :stock
  @@all = []

  def initialize product
    @title = product[:title]
    @price = product[:price]
    @stock = product[:stock]
    @@all << product
  end

  def self.all
    @@all
  end

end
