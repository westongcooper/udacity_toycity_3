class Customer
  attr_accessor :name
  @@all = []

  def initialize customer
    @name = customer[:name]
    add_to_customer_database
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.select{ |customer| customer.name == name }.first
  end

  def add_to_customer_database
    raise DuplicateCustomerError.new(self) if current_customer?
    @@all << self
  rescue DuplicateCustomerError => e
    p e
  end

  def all_purchases
    Transaction.all.select{ |transaction| transaction.customer == self }
  end

  def current_customer?
    !!self.class.find_by_name(@name)
  end

  def purchase product, sales_price=nil
    Transaction.new(self, product, sales_price)
  end
end