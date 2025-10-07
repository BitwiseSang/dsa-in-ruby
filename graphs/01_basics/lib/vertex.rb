# Individual vertex class
class Vertex
  attr_accessor :value, :adjacent_vertices

  def initialize(value)
    @value = value
    @adjacent_vertices = []
  end

  def add_adjacent_vertex(vertex)
    return if @adjacent_vertices.include?(vertex)

    @adjacent_vertices << vertex
    vertex.add_adjacent_vertex(self)
  end
end
