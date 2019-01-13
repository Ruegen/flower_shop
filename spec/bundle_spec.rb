require "bundle"

describe "bundle" do
  it "should match initialize values" do
    name = "Roses"
    code = :R12
    qty = 10
    price_in_cents = 1299
    bundle = Bundle.new code, qty, price_in_cents, name
    expect(bundle.name).must_equal name
    expect(bundle.code).must_equal code
    expect(bundle.qty).must_equal qty
    expect(bundle.price_in_cents).must_equal price_in_cents
  end
end
