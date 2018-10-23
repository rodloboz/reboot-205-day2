# === USER STORIES
# As as user I can...
# - list items
# - add an item
# - delete an item
# - can mark/unmark an item
# - can import an item from Etsy

# welcome user
# Shortcurt.     (L)ist (A)dd...
# display menu (list | add | delete | mark | import )
# ask user for action
# store user action
# execute chosen action => CASE

# LIST ITEMS
# - iterate/go through each item
# - get index of each item
# => each_with_index
# - determine whether or not it is marked
# - puts item to screen

# ADD ITEM
# - ask user for the name of the item
# - store user answer
# -  build item hash with name = answer
# -  and marked as false
# { name: name, marked: false }
# - push hash into LIST

# DELETE ITEM
# - display list
# - ask which item (ask for index)
# - store index
# - remove item with that index from LIST
# => LIST.delete_at(index)

# MARKING/UNMARKING ITEMS
# - display list
# - ask which item (ask for index)
# - store index
# - find item with that index
# - change to opposite (flipping the value)

# IMPORT ITEM
# - ask user what they are searching for
# - store search term
# ==== SCRAPPER
# - visit etsy (open-uri)
# - ask etsy for what user is searching (parse HTML)
# =========
# - display response (list of things) to user
# - ask user to select one of these things
# - add item user selected (can reuse add_item)


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

# 1 - [X] Socks
# 2 - [ ] Macbook

require_relative 'welcome'
require_relative 'view'
require_relative 'item'
require_relative 'services'

puts_welcome
loop do
  display_menu
  puts "Choose an option:"
  print "> "
  action = gets.chomp
  case action
  when /^l(ist)?$/i
    display_list
  when /^i(mport)?$/i
    ask_for_item(:import)
    term = gets.chomp
    # expect to receive arr of strings
    articles = fetch_from_etsy(term)
    display_articles(articles)
    ask_for_index(:import)
    index = gets.chomp.to_i - 1
    name = articles[index]
    add_item(name)
  when /^a(dd)?$/i
    ask_for_item(:add)
    name = gets.chomp
    add_item(name)
  when /^u?(n?m(ark)?)?$/i
    display_list
    ask_for_index(:mark)
    index = gets.chomp.to_i - 1
    item = find_item(index)
    mark_item(item)
  when /^d(elete)?$/i
    display_list
    ask_for_index(:delete)
    index = gets.chomp.to_i - 1
    delete_item(index)
  when /^q(uit)?$/i
    break
  else
    puts "Please chose a valid option"
  end
end

puts "Goodbye!"



