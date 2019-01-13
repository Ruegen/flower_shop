require "bundle"

class LineItem
  attr_accessor :code, :qty, :bundle, :best_fit

  def initialize(line_item)
    @code = line_item[:code]
    @qty = line_item[:qty]
    @bundle = Bundle.get_bundle_by_code @code
    @best_fit = find_line_item_best_fit @qty, @bundle
  end

  private

  def find_line_item_best_fit(qty, bundle)
    return nil if qty < 0
    return nil if qty != qty.floor

    cache = Array.new(qty + 1)
    cache[0] = 0
    worklist = [[0, 0]]
    while cache[qty].nil? && !worklist.empty?
      base, starting_index = worklist.shift
      starting_index.upto(bundle.size - 1) do |index|
        amount = bundle[index].qty
        tot = base + amount
        if tot <= qty && cache[tot].nil?
          cache[tot] = base
          worklist << [tot, index]
        end
      end
    end

    return nil if cache[qty].nil?
    result = []
    while qty > 0
      group = cache[qty]
      result << qty - group
      qty = group
    end
    result.sort!.reverse!
  end
end
