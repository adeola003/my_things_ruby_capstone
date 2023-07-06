require_relative '../src/author'
require_relative '../src/item'

describe Author do
  context 'Testing the author class' do
    let(:author) { Author.new('John', 'Doe') }
    let(:item) { instance_double(Item) }

    it 'Should create a new author with the given arguments' do
      expect(author).to be_an_instance_of(Author)
    end
  end
end
