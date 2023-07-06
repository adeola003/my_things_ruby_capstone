require_relative '../src/game'
require 'date'

describe Game do
  context 'Testing the game class' do
    let(:game) { Game.new(Date.parse('2012-02-27'), true, '2013-12-12') }

    it 'Should create a new game with the given arguments' do
      expect(game).to be_an_instance_of(Game)
    end

    it 'Should return the correct multiplayer value' do
      expect(game.multiplayer).to eq(true)
    end

    it 'Should return the correct last_played_at value' do
      expect(game.last_played_at).to eq('2013-12-12')
    end

    it 'Should return true if the parent method returns true or if last_played_at is older than 2 years' do
      expect(game.can_be_archived?).to eq(true)
    end
  end
end
