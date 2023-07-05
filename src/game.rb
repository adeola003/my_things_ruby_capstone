require_relative 'item'

class Game < Item
  attr_accessor :last_played_at

  def initialize(published_date)
    super(published_date)
    @last_played_at = nil
  end

  def can_be_archived?
    super && last_played_at && last_played_at < (Time.now - (2 * 365 * 24 * 60 * 60))
  end
end
