require_relative 'lib/vertex'
require_relative 'lib/graph'

alice = Vertex.new('Alice')
bob = Vertex.new('Bob')
cynthia = Vertex.new('Cynthia')

alice.add_adjacent_vertex(bob)
alice.add_adjacent_vertex(cynthia)
bob.add_adjacent_vertex(cynthia)

puts "#{alice.value} has the following friends:"
alice.adjacent_vertices.each do |vertex|
  puts vertex.value
end

def vertex_generator(value)
  Vertex.new(value)
end

asha = Vertex.new('Asha')
brandy = Vertex.new('Brandy')
candy = Vertex.new('Candy')
derek = Vertex.new('Derek')
elaine = Vertex.new('Elaine')
fred = Vertex.new('Fred')
gina = Vertex.new('Gina')
helen = Vertex.new('Helen')
irena = Vertex.new('Irena')

asha.add_adjacent_vertex(brandy)
asha.add_adjacent_vertex(candy)
asha.add_adjacent_vertex(derek)
asha.add_adjacent_vertex(elaine)
brandy.add_adjacent_vertex(fred)
fred.add_adjacent_vertex(helen)
helen.add_adjacent_vertex(candy)
candy.add_adjacent_vertex(helen)
derek.add_adjacent_vertex(gina)
gina.add_adjacent_vertex(irena)
derek.add_adjacent_vertex(elaine)

puts '------------------'
puts 'DFS traversal'
puts '------------------'
Graph.dfs_traversal(asha) { |vertex| puts vertex.value }
puts '------------------'
puts 'DFS'
puts '------------------'
puts Graph.dfs(asha, 'Helen')

puts '------------------'
puts 'BFS traversal'
puts '------------------'
Graph.bfs_traversal(asha) { |vertex| puts vertex.value }
puts '------------------'
puts 'BFS recursive traversal'
puts '------------------'
Graph.bfs_recursive_traversal(asha) { |vertex| puts vertex.value }
puts '------------------'
puts 'BFS'
puts '------------------'
puts Graph.dfs(asha, 'Asha')
