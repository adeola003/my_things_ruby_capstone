require 'date'
require_relative '../src/game'

RSpec.describe Game do
  let(:game) { Game.new(Date.today) }

  describe '#can_be_archived?' do
    context 'when last_played_at is older than 2 years' do
      before do
        game.last_played_at = Date.today - (2 * 365 + 1)
      end

      it 'returns true' do
        expect(game.can_be_archived?).to be true
      end
    end

    context 'when last_played_at is within 2 years' do
      before do
        game.last_played_at = Date.today - (2 * 365 - 1)
      end

      it 'returns false' do
        expect(game.can_be_archived?).to be false
      end
    end

    context 'when last_played_at is nil' do
      before do
        game.last_played_at = nil
      end

      it 'returns false' do
        expect(game.can_be_archived?).to be false
      end
    end
  end
end
