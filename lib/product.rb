class Product
  attr_accessor :title, :price, :stock
  @@all = []

  def initialize product
    @title = product[:title]
    @price = product[:price]
    @stock = product[:stock]
    add_to_inventory
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

  def all_transactions
    Transaction.all.select{ |transaction| transaction.product == self }
  end

  def product_revenue
    all_transactions.reduce(0) { |sum, transaction| sum += transaction.sales_price }
  end

  def add_to_inventory
    raise DuplicateProductError.new(self) if current_inventory?
    @@all << self
  rescue DuplicateProductError => e
    p e
  end

  def current_inventory?
    !!self.class.find_by_title(@title)
  end

  def in_stock?
    self.stock > 0
  end

  def decreate_stock
    self.stock -= 1
  end
end
