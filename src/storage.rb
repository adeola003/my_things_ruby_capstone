require 'json'
require_relative 'book'
require_relative 'label'
require_relative 'music_album'
require_relative 'genre'
require_relative 'game'
require_relative 'author'

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

  def save_music_albums_genres(music_albums, genres)
    saved_music_albums = []
    saved_genres = []

    music_albums.each do |album|
      saved_music_albums << {
        'published_date' => album.published_date.to_s,
        'on_spotify' => album.on_spotify
      }
    end

    genres.each do |genre|
      saved_genres << {
        'name' => genre.name
      }
    end

    File.write('data/music_albums.json', JSON.pretty_generate(saved_music_albums))
    File.write('data/genres.json', JSON.pretty_generate(saved_genres))
  end

  def load_music_albums_genres(app)
    loaded_music_albums = JSON.parse(File.read('data/music_albums.json'))
    loaded_genres = JSON.parse(File.read('data/genres.json'))

    loaded_music_albums.each do |album_data|
      published_date = Date.parse(album_data['published_date'])
      on_spotify = album_data['on_spotify']

      album = MusicAlbum.new(published_date)
      album.on_spotify = on_spotify

      app.music_albums << album
    end

    loaded_genres.each do |genre_data|
      name = genre_data['name']

      genre = Genre.new(name)
      app.genres << genre
    end
  end

  def save_authors_games(authors, games)
    saved_authors = []
    saved_games = []

    authors.each do |author|
      saved_authors << {
        'id' => author.id,
        'first_name' => author.first_name,
        'last_name' => author.last_name
      }
    end

    games.each do |game|
      saved_games << {
        'published_date' => game.published_date.to_s,
        'multiplayer' => game.multiplayer,
        'last_played_at' => game.last_played_at.to_s
      }
    end

    File.write('data/authors.json', JSON.pretty_generate(saved_authors))
    File.write('data/games.json', JSON.pretty_generate(saved_games))
  end

  def load_authors_games(app)
    loaded_authors = JSON.parse(File.read('data/authors.json'))
    loaded_games = JSON.parse(File.read('data/games.json'))

    loaded_authors.each do |author_data|
      first_name = author_data['first_name']
      last_name = author_data['last_name']
      loaded_author = Author.new(first_name, last_name)
      app.authors << loaded_author
    end
    loaded_games.each do |game_data|
      published_date = game_data['published_date']
      multiplayer = game_data['multiplayer']
      last_played_at = game_data['last_played_at']

      loaded_game = Game.new(published_date, multiplayer, last_played_at)
      app.games << loaded_game
    end
  end
end
