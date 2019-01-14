require "order"
require "line_item"

describe "order" do
  let(:order) { Order.load_order }

  it "should be an instance" do
    expect(order).must_be_instance_of Order
  end

  it "should return a line item" do
    expect(order.line_items.first).must_be_instance_of LineItem
  end
end
