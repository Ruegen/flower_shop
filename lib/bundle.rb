require "json"

class Bundle
  @@bundles = []

  FILE_NAME = "bundles.json"
  PATH = "data/" + FILE_NAME

  attr_accessor :code, :qty, :price_in_cents, :title

  def initialize(code, qty, price, title)
    @code = code.to_sym
    @qty = qty
    @price_in_cents = price
    @title = title
  end

  def self.bundles
    @@bundles
  end

  def self.get_bundle_by_code(code)
    self.get_bundles
    @@bundles.select { |bundle|
      bundle.code == code
    }
  end

  private

  def self.get_bundles
    @@bundles = []
    file = File.read(PATH)
    bundles = JSON.parse(file, symbolize_names: true)

    bundles.each do |bundle|
      code = bundle[:code]
      qty = bundle[:qty]
      price = bundle[:price]
      title = bundle[:title]
      @@bundles << new(code, qty, price, title)
    end
    @@bundles
  end
end
