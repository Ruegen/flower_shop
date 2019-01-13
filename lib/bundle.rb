class Bundle
  @@bundles = nil

  attr_accessor :code, :qty, :price_in_cents, :name

  def initialize(code, qty, price_in_cents, name)
    @code = code
    @qty = qty
    @price_in_cents = price_in_cents
    @name = name
  end

  def self.bundles
    @@bundles
  end
end
