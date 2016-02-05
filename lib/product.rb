class Product
  attr_accessor :title, :price, :stock
  @@all = []

  def initialize product
    @title = product[:title]
    @price = product[:price]
    @stock = product[:stock]
    add_to_inventory(product)
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    @@all.select{ |product| product.title == title }.first
  end

  def self.in_stock
    @@all.select{ |product| product.in_stock? }
  end

  def add_to_inventory product
    raise DuplicateProductError.new(product) if current_inventory?
    @@all << self
  rescue DuplicateProductError => e
    puts e
  end

  def current_inventory?
    !!self.class.find_by_title(@title)
  end

  def in_stock?
    self.stock > 0
  end
end
