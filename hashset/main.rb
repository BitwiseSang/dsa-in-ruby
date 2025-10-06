require_relative 'lib/hashset'

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
