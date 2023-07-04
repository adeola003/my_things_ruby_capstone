require_relative 'src/item'

def print_menu
  puts 'Options:'
  puts '1. List all items'
  puts '2. Move item to archive'
  puts '3. Quit'
end

def list_all_items(items)
  puts 'Items:'
  items.each do |item|
    puts "ID: #{item.id}, Title: #{item.title}, Published Date: #{item.published_date}, Archived: #{item.archived}"
  end
end

def move_item_to_archive(items)
  puts 'Enter the ID of the item to move to the archive:'
  id = gets.chomp.to_i
  item_found = items.find { |item| item.id == id }
  if item_found
    item_found.move_to_archive
  else
    puts "Item with ID #{id} not found."
  end
end

# Main loop
loop do
  print_menu
  option = gets.chomp.to_i

  case option
  when 1
    list_all_items(items)
  when 2
    move_item_to_archive(items)
  when 3
    break
  else
    puts 'Invalid option. Please choose again.'
  end
end
