class Bundle
  @@bundles = nil

  attr_accessor :code, :qty, :price_in_cents, :title

  def initialize(code, qty, price_in_cents, title)
    @code = code
    @qty = qty
    @price_in_cents = price_in_cents
    @title = title
  end

  def self.bundles
    @@bundles
  end
end
