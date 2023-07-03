class genre
  attr_reader :id, :name, :items
  
  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []

  end
  def add_item(item)
    @item <<item unless @items.include?(item)
    item.genre = self
  end
end
