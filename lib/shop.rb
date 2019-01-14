require "order"

class Shop
  def initialize
    @order = nil
  end

  def issue_order
    @order = Order.load_order
  end

  def print_invoice
    @order.print_line_items
  end
end
