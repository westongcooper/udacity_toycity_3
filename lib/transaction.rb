class Transaction
  attr_accessor :product, :customer

  def initialize customer, product
    @customer = customer
    @product = product
  end
end