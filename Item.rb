class Item
  attr_accessor :id, :title, :published_date, :archived

  def initialize(id, title, published_date)
    @id = id
    @title = title
    @published_date = published_date
    @archived = false
  end

  def can_be_archived?
    (Time.now.year - @published_date.year) > 10
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
      puts "#{@title} has been moved to the archive."
    else
      puts "#{@title} cannot be archived at this time."
    end
  end
end
