require_relative '../../../queue/lib/queue'

# The knight class
class Knight
  def self.knight_moves(start_position, final_position)
    queue = Queue.new
    min_steps = nil
    shortest_paths = []
    queue.enqueue([start_position, [start_position]])
    until queue.empty?
      position, path = queue.dequeue
      break if min_steps && path.length > min_steps

      if position == final_position
        shortest_paths << path
        min_steps = path.length
        next
      end
      neighbors(position) do |neighbor|
        queue.enqueue([neighbor, path + [neighbor]]) unless path.include?(neighbor)
      end
    end
    shortest_paths.min
  end

  def self.neighbors(position)
    x, y = position
    moves = [
      [1, 2], [2, 1], [2, -1], [1, -2],
      [-1, 2], [-2, 1], [-2, -1], [-1, -2]
    ]
    moves.each do |dx, dy|
      neighbor = [x + dx, y + dy]
      yield(neighbor) if valid?(neighbor)
    end
  end

  def self.valid?((x, y))
    return true if (0..7).include?(x) && (0..7).include?(y)

    false
  end
end
