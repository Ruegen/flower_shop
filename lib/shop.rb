class Shop
  def initialize
    @order = nil
  end

  def issue_order(qty, code)
    @order = Order.new qty code
  end

  def print_invoice
  end
end
