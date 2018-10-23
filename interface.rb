# === USER STORIES
# As as user I can...
# - list items
# - add an item
# - delete an item
# - can mark/unmark an item

# welcome user
# Shortcurt.     (L)ist (A)dd...
# display menu (list | add | delete | mark)
# ask user for action
# store user action
# execute chosen action => CASE

LIST = [
  {
    name: "socks",
    marked: true
  },
  {
    name: "macbook",
    marked: false
  }
]

# 1- Socks [X]
# 2- Macbook []

require_relative 'welcome'
require_relative 'view'

puts_welcome
loop do
  display_menu
  puts "Choose an option:"
  print "> "
  action = gets.chomp
  case action
  when /^l(ist)?$/i
    puts "Listing items..."
  when /^a(dd)?$/i
    puts "Adding item.."
  when /^u?(n?m(ark)?)?$/i
    puts "marking/unmarking item"
  when /^d(elete)?$/i
    puts "deleting item"
  when /^q(uit)?$/i
    break
  else
    puts "Please chose a valid option"
  end
end

puts "Goodbye!"



