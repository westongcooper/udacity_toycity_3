class DuplicateProductError < StandardError
  attr_accessor :product

  def initialize(product)
    @product = product
    super(message)
  end

  def message
    "'#{@product[:title]}' already exist"
  end
end

class DuplicateCustomerError < StandardError
  attr_accessor :customer

  def initialize(customer)
    @customer = customer
    super(message)
  end

  def message
    "'#{@customer[:name]}' already exist"
  end
end