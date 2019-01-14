require "bundle"
require "money"

class LineItem
  Money.locale_backend = :currency
  attr_accessor :code, :qty, :bundle, :best_fit

  def initialize(line_item)
    @code = line_item[:code]
    @qty = line_item[:qty]
    @bundle = Bundle.get_bundle_by_code @code
    best_fit = get_best_fit @qty, @bundle
    @bundle_best_fit = bundle_by_best_fit best_fit, @bundle
  end

  def print_total
    total_in_cents = @bundle_best_fit.reduce(0) do |total, bundle|
      total + bundle.price_in_cents
    end
    total_in_dollars = Money.new(total_in_cents, "USD").format
    puts "#{@qty} #{@code} #{total_in_dollars}"
  end

  def print_subtotal
    order_collection = Hash.new(0)

    # iterate over the array, counting duplicate entries
    @bundle_best_fit.each do |order|
      order_collection[order] += 1
    end

    order_collection.each do |order, n|
      price_in_dollars = Money.new(order.price_in_cents, "USD").format
      puts "\t#{n} x #{order.qty} #{price_in_dollars}"
    end
  end

  private

  # coin change problem algorithim
  # returns an array of integers
  def get_best_fit(qty, bundle)
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

  def bundle_by_best_fit(best_fit, bundles)
    bundles_by_best_fit = []
    best_fit.each { |qty|
      bundles.each { |bundle|
        if bundle.qty == qty
          bundles_by_best_fit.push bundle
        end
      }
    }
    bundles_by_best_fit
  end
end
