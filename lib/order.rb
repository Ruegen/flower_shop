require "bundle"
require "line_item"
require "json"

class Order
  FILE_NAME = "order.json"
  PATH = "data/" + FILE_NAME

  def self.load_order
    file = File.read(PATH)
    order = JSON.parse(file, symbolize_names: true)
    line_items = order.map do |line_item|
      line_item[:code] = line_item[:code].to_sym
      LineItem.new line_item
    end
    new(line_items)
  end

  attr_accessor :line_items

  def initialize(line_items)
    @line_items = line_items
  end

  def print_line_items
    @line_items.each do |line_item|
      line_item.print_total
      line_item.print_subtotal
    end
  end
end
