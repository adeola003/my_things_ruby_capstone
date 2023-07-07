require_relative 'item'

class Label < Item
  attr_accessor :title, :color, :items

  def initialize(title, color, published_date)
    super(published_date)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    items << item
    item.label = self
  end
end
