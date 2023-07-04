require_relative 'book'
require_relative 'label'

class App
  attr_accessor :books, :labels

  def initialize
    @books = []
    @labels = []
    @should_exit = false
  end

  def list_books
    if @books.empty?
      puts 'No books available.'
    else
      puts 'List of books:'
      @books.each do |book|
        puts "#{book.title} by #{book.author}"
      end
    end
  end

  def list_labels
    if @labels.empty?
      puts 'No labels available.'
    else
      puts 'List of labels:'
      @labels.each do |label|
        puts label.name
      end
    end
  end

  def add_book
    print 'Enter the title of the book: '
    title = gets.chomp
    print 'Enter the author of the book: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts "Book '#{book.title}' by #{book.author} added successfully."
  end

  def display_options
    puts 'Options:'
    puts '1. List all books'
    puts '2. List all labels'
    puts '3. Add a book'
    puts '4. Exit'
  end

  def leave
    @should_exit = true
    exit
  end

  def execute(choice)
    case choice
    when 1
      list_books
    when 2
      list_labels
    when 3
      add_book
    when 4
      leave
    else
      puts 'Invalid choice'
    end
  end

  def run
    until @should_exit
      display_options
      print 'Enter your choice: '
      choice = gets.chomp.to_i
      execute(choice)
    end
  end
end
