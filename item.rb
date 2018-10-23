# -  build item hash with name = answer
# -  and marked as false
# { name: name, marked: false }
# - push hash into LIST
def add_item(name)
  LIST << {name: name, marked: false}
end

# - remove item with that index from LIST
# => LIST.delete_at(index)
def delete_item(index)
  LIST.delete_at(index)
end

def find_item(index)
  # Read arr => item
  LIST[index]
end

def find_item_by_name(name)
  # { name: "socks", marked: false }
  LIST.find { |item| item[:name] == name }
  # => item
end

def mark_item(item)
  item[:marked] = !item[:marked]
end






