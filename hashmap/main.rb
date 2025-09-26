require_relative 'lib/hashmap'
require_relative 'lib/hashset'

test = HashMap.new
puts test.length

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

# Load factor at capacity
puts test.length
puts test.capacity
print test.entries

# Exceeding load factor capacity
test.set('moon', 'silver')
puts
puts test.length
puts test.capacity

# Linked list implementation
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

puts "Length after duplication: #{test.length}"
puts "Capacity after duplication: #{test.capacity}"
puts "Entries: #{test.entries}"

puts '--------------------------------------------'
puts 'HASHSET'
puts '--------------------------------------------'
hashset_test = HashSet.new
hashset_test.set('apple')
hashset_test.set('banana')
hashset_test.set('carrot')
hashset_test.set('dog')
hashset_test.set('elephant')
hashset_test.set('frog')
hashset_test.set('grape')
hashset_test.set('hat')
hashset_test.set('ice cream')
hashset_test.set('jacket')
hashset_test.set('kite')
hashset_test.set('lion')

puts "Hashset count after entry: #{hashset_test.length}"
puts "Capacity after entry: #{hashset_test.capacity}"

# Duplicating values in hash set has no effect
hashset_test.set('apple')
hashset_test.set('banana')
hashset_test.set('carrot')
hashset_test.set('dog')
hashset_test.set('elephant')
hashset_test.set('frog')
hashset_test.set('grape')
hashset_test.set('hat')
hashset_test.set('ice cream')
hashset_test.set('jacket')
hashset_test.set('kite')
hashset_test.set('lion')

puts "Hashset count after duplication: #{hashset_test.length}"
puts "Capacity after duplication: #{hashset_test.capacity}"

hashset_test.set('red')
hashset_test.set('yellow')
hashset_test.set('brown')
hashset_test.set('gray')
hashset_test.set('green')
hashset_test.set('purple')
hashset_test.set('black')
hashset_test.set('white')
hashset_test.set('blue')
hashset_test.set('pink')
hashset_test.set('golden')
puts "Hashset count after adding new elements: #{hashset_test.length}"
puts "Capacity after adding new elements: #{hashset_test.capacity}"
puts "Entries after adding new elements: #{hashset_test.entries}"

hashset_test.set('red')
hashset_test.set('yellow')
hashset_test.set('brown')
hashset_test.set('gray')
hashset_test.set('green')
hashset_test.set('purple')
hashset_test.set('black')
hashset_test.set('white')
hashset_test.set('blue')
hashset_test.set('pink')
hashset_test.set('golden')
puts "Hashset count after duplicating new elements: #{hashset_test.length}"
puts "Capacity after duplicating new elements: #{hashset_test.capacity}"
puts "Entries after duplicating new elements: #{hashset_test.entries}"
