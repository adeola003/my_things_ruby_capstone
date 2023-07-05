require 'date'
require_relative '../src/book'

RSpec.describe Book do
  let(:book) { Book.new('Publisher', 'Cover State', Date.today) }

  describe '#can_be_archived?' do
    context 'when the cover state is bad' do
      before do
        book.cover_state = 'bad'
      end

      it 'returns true' do
        expect(book.can_be_archived?).to be true
      end
    end

    context 'when the cover state is not bad' do
      before do
        book.cover_state = 'good'
      end

      context 'when the published date is more than 10 years ago' do
        before do
          book.published_date = Date.today - (11 * 365)
        end

        it 'returns true' do
          expect(book.can_be_archived?).to be true
        end
      end

      context 'when the published date is less than or equal to 10 years ago' do
        before do
          book.published_date = Date.today - (9 * 365)
        end

        it 'returns false' do
          expect(book.can_be_archived?).to be false
        end
      end
    end
  end
end
