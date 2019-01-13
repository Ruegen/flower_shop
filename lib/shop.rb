require "order"

class Shop
  def initialize
    @order = nil
  end

  def issue_order
    @order = Order.load_order
  end

  def print_invoice
    @order.line_items.each do |line_item|
      line_item.
    end
  end
end
