require_relative '../src/genre'
require_relative '../src/item'

describe Genre do
  context 'When testing the Genre class' do
    it 'should create a new genre' do
      genre = Genre.new('Jazz')

      expect(genre.name).to eq('Jazz')
      expect(genre).to be_instance_of(Genre)
      expect(genre.items).to eq([])
    end

    it "should add an item to the genre's items array" do
      genre = Genre.new('Jazz')
      item = Item.new('2022-10-10')

      genre.add_item(item)

      expect(genre.items.length).to eq(1)
      expect(genre.items[0].published_date).to eq('2022-10-10')
      expect(item.genre.name).to eq('Jazz')
    end
  end
end
