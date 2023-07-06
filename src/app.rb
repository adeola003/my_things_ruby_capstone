require 'json'
require 'date'
require_relative 'book'
require_relative 'label'
require_relative 'storage'
require_relative 'music_album'
require_relative 'game'
require_relative 'author'

class App
  attr_accessor :books, :labels, :music_albums, :games, :authors

  include Storage

  def initialize
    @books = []
    @labels = []
    @music_albums = []
    @games = []
    @authors = []
    @should_exit = false
  end

  def list_books
    if @books.empty?
      puts 'No books available.'
    else
      puts 'List of books:'
      @books.each do |book|
        puts "Publisher: #{book.publisher} Cover State: #{book.cover_state}"
      end
    end
  end

  def list_labels
    if @labels.empty?
      puts 'No labels available.'
    else
      puts 'List of labels:'
      @labels.each do |label|
        puts "Title: #{label.title} Color: #{label.color}"
      end
    end
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

  def list_games
    if @games.empty?
      puts 'No games available.'
    else
      puts 'List of games:'
      @games.each do |game|
        puts "Published Date: #{game.published_date} Last Played At: #{game.last_played_at}"
      end
    end
  end

  def list_authors
    if @authors.empty?
      puts 'No authors available.'
    else
      puts 'List of authors:'
      @authors.each do |author|
        puts "Name: #{author.name}"
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

  def add_music_album
    print 'Enter the published date of the music album (YYYY-MM-DD): '
    published_date = Date.parse(gets.chomp)
    print 'Is the music album available on Spotify? (true/false): '
    on_spotify = gets.chomp.downcase == 'true'

    album = MusicAlbum.new(published_date)
    album.on_spotify = on_spotify

    @music_albums << album

    puts 'Music album added successfully.'
  end

  def add_game
    print 'Enter the published date of the game (YYYY-MM-DD): '
    published_date = Date.parse(gets.chomp)
    print 'Enter the last played date of the game (YYYY-MM-DD): '
    last_played_at = Date.parse(gets.chomp)

    game = Game.new(published_date)
    game.last_played_at = last_played_at

    @games << game

    puts 'Game added successfully.'
  end

  def add_author
    print 'Enter the name of the author: '
    name = gets.chomp

    author = Author.new(name)
    @authors << author

    puts 'Author added successfully.'
  end

  def display_options
    puts 'Options:'
    puts '1. List all books'
    puts '2. List all labels'
    puts '3. Add a book'
    puts '4. List all music albums'
    puts '5. List all games'
    puts '6. List all authors'
    puts '7. Add a music album'
    puts '8. Add a game'
    puts '9. Add an author'
    puts '10. Exit'
  end

  def leave
    @should_exit = true
    save_books_labels(@books, @labels)
    save_music_albums(@music_albums)
    save_games(@games)
    save_authors(@authors)
    exit
  end

  def execute(choice)
    case choice
    when 1 then list_books
    when 2 then list_labels
    when 3 then add_book
    when 4 then list_music_albums
    when 5 then list_games
    when 6 then list_authors
    when 7 then add_music_album
    when 8 then add_game
    when 9 then add_author
    when 10 then leave
    else puts 'Invalid choice'
    end
  end

  def run
    load_books_labels(self)
    load_music_albums(self)
    load_games(self)
    load_authors(self)
    until @should_exit
      display_options
      print 'Enter your choice: '
      choice = gets.chomp.to_i
      execute(choice)
    end
  end
end
