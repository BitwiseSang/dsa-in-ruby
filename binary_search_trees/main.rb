require_relative 'lib/tree'
require_relative 'lib/node'

def random_number
  rand(256)
end

binary_search_tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
puts binary_search_tree

puts "Inserting random items into the tree: \n"
20.times { binary_search_tree.insert(random_number) }
puts binary_search_tree

puts 'Creating a new tree from a random unordered array'
random_array = Array.new(72) { rand(1..100) }
bst = Tree.new(random_array)
puts bst

puts "Inserting random items to the new tree: \n"
32.times { bst.insert(random_number) }
puts bst

puts "Deleting random values from the tree: \n"
32.times { bst.delete(random_number) }
puts bst

puts "--------------------\n"
puts "Finding 8 random items: \n"
8.times do
  value = random_number
  node = bst.find(value)
  puts "The node with value #{value} is #{node ? node.to_s : 'not found'}"
end

puts "--------------------\n"
puts 'Using Breadth-first-search to iterate over the values'
values = []
bst.iterative_level_order { |node| values << node.data }
puts "The array contains: #{values}"

puts "--------------------\n"
puts 'Using Depth-first-search to iterate over the values'
puts 'Preorder'
values = []
bst.preorder { |node| values << node.data }
puts "The array contains: #{values}"

puts 'Inorder'
values = []
bst.inorder { |node| values << node.data }
puts "The array contains: #{values}"

puts 'Postorder'
values = []
bst.postorder { |node| values << node.data }
puts "The array contains: #{values}"

puts "--------------------\n"
puts "Inserting random items to the new tree: \n"
128.times { bst.insert(random_number) }
puts bst

puts 'Rebalancing the tree'
bst.rebalance
puts bst

puts '---------------'
puts 'DEPTH AND HEIGHT'
puts '---------------'
puts 'Finding the depth of random nodes'
puts '---------------'
50.times do
  random = random_number
  depth = bst.depth(random)
  puts "The depth of #{random} is #{depth.nil? ? 'not found' : depth}"
end

puts '---------------'
puts 'Finding the height of random nodes'
puts '---------------'
50.times do
  random = random_number
  height = bst.height(random)
  puts "The height of #{random} is #{height.nil? ? 'not found' : height}"
end

puts "--------------------\n"
puts 'BALANCED?'
puts "--------------------\n"
puts "Inserting random items to the new tree: \n"
128.times { bst.insert(random_number) }
puts bst

puts "--------------------\n"
puts 'Checking if the tree is balanced'
puts "The tree is #{bst.balanced? ? 'balanced' : 'not balanced'}"
puts "The max depth is #{bst.find_height}"
puts "The preferred number of levels is #{Math.log2(bst.size).ceil}"

puts "--------------------\n"
puts 'Balancing the tree'
bst.rebalance
puts bst
puts "The tree is #{bst.balanced? ? 'balanced' : 'not balanced'}"
puts "The max depth is #{bst.find_height}"
puts "The preferred number of levels is #{Math.log2(bst.size + 1).ceil}"
