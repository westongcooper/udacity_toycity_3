class Transaction
  attr_accessor :product, :customer, :id
  @@total_transactions = 1

  def initialize customer, product
    @customer = customer
    @product = product
    @id = @@total_transactions
    @@total_transactions += 1
  end

end