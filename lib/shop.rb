class Shop
  def initialize
    @order = nil
  end

  def issue_order(amount, code)
    @order = Order.new amount code
  end

  def print_invoice
  end
end
