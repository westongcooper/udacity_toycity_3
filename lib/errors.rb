class DuplicateProductError < StandardError
  attr_accessor :product

  def initialize(product)
    @product = product
    super(message)
  end

  def message
    "#{self}: '#{@product[:title]}' already exist"
  end
end