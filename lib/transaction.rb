class Transaction
  attr_accessor :product, :customer, :id
  @@total_transactions = 1
  @@all = []

  def initialize customer, product
    @customer = customer
    @product = product
    @id = @@total_transactions
    @@total_transactions += 1
    process_transaction
  end

  def self.all
    @@all
  end

  def self.find id
    @@all.select{ |transaction| transaction.id == id }.first
  end

  def process_transaction
    raise OutOfStockError.new(@product) unless @product.in_stock?
    @product.decreate_stock
    @@all << self
  rescue OutOfStockError => e
    p e
  end

end