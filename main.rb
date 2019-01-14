$LOAD_PATH << "lib"
require "shop"

class ShopRun
  def self.call
    shop = Shop.new
    shop.issue_order
    shop.print_invoice
  end
end

ShopRun.call
