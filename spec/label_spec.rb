require 'date'
require_relative '../src/label'

RSpec.describe Label do
  let(:label) { Label.new('Title', 'Color', Date.today) }

  describe '#add_item' do
    let(:book) { Book.new('Publisher', 'Cover State', Date.today) }

    it 'adds the item to the label' do
      label.add_item(book)
      expect(label.items).to include(book)
      expect(book.label).to eq(label)
    end
  end

end
