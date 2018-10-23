def display_menu
  # system 'clear'
  puts "=====MENU====="
  puts "(L) List items"
  puts "(A) Add item"
  puts "(I) Import from Etsy"
  puts "(M) Mark/unmark item"
  puts "(D) Delete item"
  puts "(Q) Quit"
end

def display_list
  LIST.each_with_index do |item, index|
  # { name: "socks", marked: false }
    #.    true / false
    # if item[:marked]
    #   checked = "X"
    # else
    #   checked = " "
    # end
    checked = item[:marked] ? "X" : " "
    puts "#{index + 1} - [#{checked}] #{item[:name]}"
  end
end

def display_articles(articles)
  articles.each_with_index do |article, index|
    puts "#{index + 1} - #{article}"
  end
end

def ask_for_item(action)
  puts "What item do you want to #{action}?"
  print "> "
end

def ask_for_index(action)
  puts "What item do you want to #{action}?"
  print "> "
end







