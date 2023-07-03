require_relative 'item'
require 'date'

class Genre
  attr_reader :id, :name, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.genre = self
  end
end

genre = Genre.new("Rock")

item1 = Item.new(Date.new(2020, 1, 1))
genre.add_item(item1)

item2 = Item.new(Date.new(2021, 2, 2))
genre.add_item(item2)

puts genre.name # Output: Rock
puts genre.items # Output: [#<Item:0x0000000000000000>, #<Item:0x0000000000000001>]
