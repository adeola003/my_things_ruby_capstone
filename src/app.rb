require 'json'
require 'date'
require_relative 'book'
require_relative 'label'
require_relative 'storage'
require_relative 'music_album'
require_relative 'genre'

class App
  attr_accessor :books, :labels, :music_albums, :genres


  include Storage

  def initialize
    @books = []
    @labels = []
    @music_albums = []
    @genres = []
    @should_exit = false
  end

  def list_books
    if @books.empty?
      puts 'No books available.'
    else
      puts 'List of books:'
      @books.each do |book|
        puts "Publisher: #{book.publisher} cover_state: #{book.cover_state}"
      end
    end
  end

  def list_labels
    if @labels.empty?
      puts 'No labels available.'
    else
      puts 'List of labels:'
      @labels.each do |label|
        puts "title: #{label.title} color: #{label.color}"
      end
    end
  end

  def add_book
    print 'Enter the title for the label: '
    title = gets.chomp
    print 'Enter the publisher of the book: '
    publisher = gets.chomp
    print 'Enter the cover state of the book: '
    cover_state = gets.chomp
    print 'Enter the published date of the book (YYYY-MM-DD): '
    published_date = Date.parse(gets.chomp)
    print 'Enter the color of the label: '
    color = gets.chomp

    book = Book.new(publisher, cover_state, published_date)
    label = Label.new(title, color, published_date)

    @books << book
    @labels << label

    puts 'Book added successfully.'
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'No music albums available.'
    else
      puts 'List of music albums:'
      @music_albums.each do |album|
        puts "Published Date: #{album.published_date} On Spotify: #{album.on_spotify}"
      end
    end
  end

  def list_genres
    if @genres.empty?
      puts 'No genres available.'
    else
      puts 'List of genres:'
      @genres.each do |genre|
        puts "Name: #{genre.name}"
      end
    end
  end

  def add_music_album
    print 'Enter the published date of the music album (YYYY-MM-DD): '
    published_date = Date.parse(gets.chomp)
    print 'Is the music album available on Spotify? (true/false): '
    on_spotify = gets.chomp.downcase == 'true'

    album = MusicAlbum.new(published_date)
    album.on_spotify = on_spotify

    print 'Enter the genre name: '
    genre_name = gets.chomp

    genre = Genre.new(genre_name)
    genre.add_item(album)

    @music_albums << album
    @genres << genre

    puts 'Music album added successfully.'
  end


  def display_options
    puts 'Options:'
    puts '1. List all books'
    puts '2. List all labels'
    puts '3. Add a book'
    puts '4. List all music albums'
    puts '5. List all genres'
    puts '6. Add a music album'
    puts '7. Exit'
  end

  def leave
    @should_exit = true
    save_books_labels(@books, @labels)
    save_music_albums_genres(@music_albums, @genres)
    exit
  end

  def execute(choice)
    case choice
    when 1 then list_books
    when 2 then list_labels
    when 3 then add_book
    when 4 then list_music_albums
    when 5 then list_genres
    when 6 then add_music_album
    when 7 then leave
    else puts 'Invalid choice'
    end
  end

  def run
    load_books_labels(self) && load_music_albums_genres(self)
    until @should_exit
      display_options
      print 'Enter your choice: '
      choice = gets.chomp.to_i
      execute(choice)
    end
  end
end
