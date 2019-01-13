require "bundle"

describe "bundle" do
  let(:code) { :R12 }

  it "should match initialize values" do
    name = "Roses"
    qty = 10
    price_in_cents = 1299

    bundle = Bundle.new code, qty, price_in_cents, name
    expect(bundle.name).must_equal name
    expect(bundle.code).must_equal code
    expect(bundle.qty).must_equal qty
    expect(bundle.price_in_cents).must_equal price_in_cents
  end

  it "should add bundle each initialize" do
    expect(Bundle.bundles).must_be_nil
  end

  #   it "should return bundles by code" do
  #     Bundle.get_bundles_by_code code
  #   end
end
