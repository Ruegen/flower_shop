require "shop"

order = [
  {qty: 10, code: :R12},
  {qty: 15, code: :L09},
  {qty: 13, code: :T58},
]

describe "shop" do
  let(:orders) { orders }
  result = "" "
  10 R12 $12.99
        1 x 10 $12.99 
  15 L09 $41.90
        1 x 9 $24.95
        1 x 6 $16.95 
  13 T58 $25.85
        2 x 5 $9.95
        1 x 3 $5.95
  " ""

  it "should print invoice" do
    # shop = Shop.new
    # shop.issue_order order
    # expect(shop.print_invoice).must_equal result
  end
end
