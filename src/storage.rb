require 'json'
require_relative 'book'
require_relative 'label'

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

  def load_books_labels(app)
    loaded_books = JSON.parse(File.read('data/books.json'))
    loaded_labels = JSON.parse(File.read('data/labels.json'))

    loaded_books.each do |book_data|
      publisher = book_data['publisher']
      cover_state = book_data['cover_state']
      published_date = Date.parse(book_data['published_date'])

      book = Book.new(publisher, cover_state, published_date)
      app.books << book
    end

    loaded_labels.each do |label_data|
      title = label_data['title']
      color = label_data['color']
      published_date = Date.parse(label_data['published_date'])

      label = Label.new(title, color, published_date)
      app.labels << label
    end
  end
end
