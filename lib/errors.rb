class ToyCityError < StandardError
  attr_accessor :item
  def initialize(item)
    @item = item
    super(message)
  end
end
class DuplicateProductError < ToyCityError
  def message
    "'#{@item.title}' already exist."
  end
end

class DuplicateCustomerError < ToyCityError
  def message
    "'#{@item.name}' already exist."
  end
end

class OutOfStockError < ToyCityError
  def message
    "'#{@item.title}' is out of stock."
  end
end