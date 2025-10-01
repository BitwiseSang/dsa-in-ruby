require_relative 'lib/directory'

dir = Directory.new
# puts 'ls of the current dir'
# dir.ls

puts 'Tree of a directory - Defaults to home directory'
puts 'mapping the root directory'
start = Time.now
dir.tree
finish = Time.now
puts "Mapping the root directory took #{(finish - start) / 60} minutes"
