require_relative 'item'
require_relative 'storage'

class Label < Item
  attr_accessor :title, :color, :items

  include Storage

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
