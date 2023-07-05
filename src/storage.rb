require 'json'

module Storage
  def save_books_labels(books, labels)
    saved_books = []
    saved_labels = []

    books.each do |book|
      saved_books << {
        'id' => book.id,
        'publisher' => book.publisher,
        'cover_state' => book.cover_state,
        'published_date' => book.published_date
      }
    end

    labels.each do |label|
      saved_labels << {
        'title' => label.title,
        'color' => label.color,
        'published_date' => label.published_date
      }
    end

    File.write('data/books.json', JSON.pretty_generate(saved_books))
    File.write('data/labels.json', JSON.pretty_generate(saved_labels))
  end
end
