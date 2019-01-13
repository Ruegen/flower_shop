require "line_item"
require "bundle"

describe "line item" do
  let(:line_item) { LineItem.new({code: :L09, qty: 15}) }

  it "should be an instance" do
    expect(line_item.code).must_equal :L09
    expect(line_item.qty).must_equal 15
    expect(line_item).must_be_instance_of LineItem
  end

  it "should find best fit for bundle" do
    result = line_item.send(:get_best_fit, line_item.qty, line_item.bundle)
    expect(result).must_equal [9, 6]
  end

  it "should print total of line item" do
    expected = "15 L09 $41.90"
    expect(line_item.print_total).must_equal expected
  end

  it "should find best fit for given quantity and bundle" do
    expect(
      line_item.send(:get_best_fit, 10, Bundle.get_bundle_by_code(:R12))
    ).must_equal [10]

    expect(
      line_item.send(:get_best_fit, 15, Bundle.get_bundle_by_code(:L09))
    ).must_equal [9, 6]

    expect(
      line_item.send(:get_best_fit, 13, Bundle.get_bundle_by_code(:T58))
    ).must_equal [5, 5, 3]
  end
end
