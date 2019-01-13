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

  describe "class methods" do
    it "should return bundles by code" do
      bundles = Bundle.get_bundle_by_code code
      expect(bundles.first.code).must_equal code
    end

    it "should return bundle of instances" do
      bundles = Bundle.get_bundles
      expect(bundles.first).must_be_instance_of Bundle
    end
  end
end
