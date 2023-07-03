require_relative 'item'
class Label < Item
  attr_accessor :title, :color, :items
  #
  def initialize(title, color, items)
    @title = title
    @color = color
    @items = items
  end

  def add_item
end
