require "bundle"

describe "bundle" do
  let(:code) { :R12 }
  let(:title) { "Roses" }
  let(:qty) { 10 }
  let(:price_in_cents) { 1299 }

  it "should match initialize values" do
    bundle = Bundle.new code, qty, price_in_cents, title
    expect(bundle.title).must_equal title
    expect(bundle.code).must_equal code
    expect(bundle.qty).must_equal qty
    expect(bundle.price_in_cents).must_equal price_in_cents
  end

  it "should add bundle each initialize" do
    expect(Bundle.bundles).must_be_nil
    bundle = Bundle.new code, qty, price_in_cents, title
    expect(Bundle.bundles).must_include bundle
  end

  #   it "should return bundles by code" do
  #     Bundle.get_bundles_by_code code
  #   end
end
