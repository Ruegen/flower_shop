require "shop"

describe "shop" do
  it "should print invoice" do
    result = "" "10 R12 $12.99
\t1 x 10 $12.99
15 L09 $41.90
\t1 x 9 $24.95
\t1 x 6 $16.95
13 T58 $25.85
\t2 x 5 $9.95
\t1 x 3 $5.95
" ""
    shop = Shop.new
    shop.issue_order
    out, err = capture_io do
      shop.print_invoice
    end
    expect(out).must_equal result
  end
end
