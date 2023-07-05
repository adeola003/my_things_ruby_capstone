class Item
  attr_accessor :id, :published_date, :archived, :genre, :author, :label

  def initialize(published_date, archived: false)
    @id = Random.rand(1..1000)
    @published_date = published_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    (Time.now.year - @published_date.year) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
    @archived = false unless can_be_archived?
  end
end
