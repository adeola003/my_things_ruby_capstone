require_relative 'item'
require 'date'
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(published_date)
    super(published_date)
    @on_spotify = false
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
