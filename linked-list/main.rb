require_relative 'lib/linked_list'
require_relative 'lib/node'

node1 = Node.new('Once')

# Recursive iteration through a linked list
def linked_list_iteration(node)
  if node.next_node.nil?
    print "#{node.value} "
    return
  end

  print "#{node.value} "
  linked_list_iteration(node.next_node)
end

# Append method on the linked list.
list = LinkedList.new(node1)
list.append('upon')
list.append('a')
list.append('time...')
list.to_s

# Prepend method on the linked list.
prepend_list_example = LinkedList.new(Node.new('time...'))
prepend_list_example.prepend('a')
prepend_list_example.prepend('upon')
prepend_list_example.prepend('Once')
prepend_list_example.to_s

# Finding the size of the linked list, i.e. the number of nodes
puts "\nThe linked list is of size: #{list.size}"

# #at(index) method for finding the value at a specific index
list.size.times do |index|
  puts list.at(index)
end

puts list.at(10) # returns nil if index is out of range

# #find(value) method returns the index of a value if present and nil otherwise

puts "The index of Once is #{list.find('Once')}"
puts "The index of upon is #{list.find('upon')}"
puts "The index of time is #{list.find('time...')}"

# #pop method removes the last node

list.pop
list.to_s

# #contains? method to check whether the linked list has a particular value

puts ''
puts list.contains?('Once')
puts list.contains?('time...')
