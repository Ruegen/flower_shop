require "order"

describe "order" do
  let(:order) { Order.load_order }

  it "should be an instance" do
    expect(order).must_be_instance_of Order
  end
end
