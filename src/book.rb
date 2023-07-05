require_relative 'item'
require_relative 'storage'

class Book < Item
  attr_accessor :publisher, :cover_state

  include Storage

  def initialize(publisher, cover_state, published_date)
    super(published_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
