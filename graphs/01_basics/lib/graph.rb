require_relative '../../../hashset/lib/hashset'
require_relative '../../../queue/lib/queue'

# Graph class
class Graph
  def self.dfs_traversal(vertex, visited_vertices = {}, &block)
    visited_vertices[vertex.value] = true
    yield (vertex)

    vertex.adjacent_vertices.each do |adjacent_vertex|
      next if visited_vertices[adjacent_vertex.value]

      dfs_traversal(adjacent_vertex, visited_vertices, &block)
    end
  end

  def self.dfs(vertex, search_value, visited_vertices = HashSet.new, &block)
    visited_vertices.set(vertex.value)

    return vertex if vertex.value == search_value

    vertex.adjacent_vertices.each do |adjacent_vertex|
      next if visited_vertices.includes?(adjacent_vertex.value)

      return adjacent_vertex if adjacent_vertex.value == search_value

      next_iteration = dfs(adjacent_vertex, search_value, visited_vertices, &block)
      return next_iteration if next_iteration
    end
    nil
  end

  def self.bfs_traversal(vertex, queue = Queue.new, visited_vertices = {})
    visited_vertices[vertex.value] = true
    queue.enqueue(vertex)
    until queue.empty?
      current_vertex = queue.dequeue
      yield(current_vertex)
      current_vertex.adjacent_vertices.each do |adjacent_vertex|
        next if visited_vertices[adjacent_vertex.value]

        queue.enqueue(adjacent_vertex)
        visited_vertices[adjacent_vertex.value] = true
      end
    end
  end

  def self.bfs_recursive_traversal(vertex, queue = Queue.new, visited_vertices = {}, &block)
    return if vertex.nil?

    visited_vertices[vertex.value] = true
    yield(vertex)
    vertex.adjacent_vertices.each do |adjacent_vertex|
      queue.enqueue(adjacent_vertex) unless visited_vertices[adjacent_vertex.value]
      visited_vertices[adjacent_vertex.value] = true
    end
    bfs_recursive_traversal(queue.dequeue, queue, visited_vertices, &block)
  end

  def self.bfs(vertex, search_value, queue = Queue.new, visited_vertices = {}, &block)
    return if vertex.nil?

    visited_vertices[vertex.value] = true
    return vertex if vertex.value == search_value

    vertex.adjacent_vertices.each do |adjacent_vertex|
      queue.enqueue(adjacent_vertex) unless visited_vertices[adjacent_vertex.value]
      visited_vertices[adjacent_vertex.value] = true
    end
    bfs_recursive_traversal(queue.dequeue, queue, visited_vertices, &block)
  end
end
