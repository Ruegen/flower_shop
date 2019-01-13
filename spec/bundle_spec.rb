require "bundle"

describe "bundle instance" do
  before(:all) { Bundle.class_variable_set :@@bundles, [] }

  let(:code) { :R12 }
  let(:title) { "Roses" }
  let(:qty) { 10 }
  let(:price_in_cents) { 1299 }
  let(:bundle) { Bundle.new code, qty, price_in_cents, title }

  it "should match initialize values" do
    expect(bundle.title).must_equal title
    expect(bundle.code).must_equal code
    expect(bundle.qty).must_equal qty
    expect(bundle.price_in_cents).must_equal price_in_cents
  end

  it "should add bundle each initialize" do
    expect(Bundle.bundles).must_include bundle
    expect(Bundle.bundles.count).must_equal 1
  end

  it "should return bundles by code" do
    Bundle.get_bundles_by_code code
  end
end
