# Binary search tree node
class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
  end

  def <=>(other)
    @data <=> other.data
  end
end
