require_relative 'node'
require_relative '../../queue/lib/queue'

# Binary Search Tree
class Tree
  attr_accessor :root

  def initialize(array)
    @array = array.uniq.sort
    @root = build_tree
  end

  def build_tree(start_index = 0, end_index = @array.length - 1)
    # base case
    return if start_index > end_index

    mid = start_index + ((end_index - start_index) / 2).floor
    root = Node.new(@array[mid])

    # recursive loop
    root.left = build_tree(start_index, mid - 1)
    root.right = build_tree(mid + 1, end_index)

    root
  end

  def to_s(node = @root, prefix = '', is_left: true)
    to_s(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    to_s(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true) if node.left
  end

  def insert(value, node = @root)
    if value > node.data
      return node.right = Node.new(value) if node.right.nil?

      insert(value, node.right)
    else
      return node.left = Node.new(value) if node.left.nil?

      insert(value, node.left)
    end
  end

  def remove_node(value, node)
    if node.left.nil?
      node.right
    elsif node.right.nil?
      node.left
    else
      node.right = successor(value, node)
    end
  end

  def delete(value, node = @root)
    return nil if node.nil?

    if value < node.data
      node.left = delete(value, node.left) unless node.left.nil?
      node
    elsif value > node.data
      node.right = delete(value, node.right) unless node.right.nil?
      node
    elsif value == node.data
      remove_node(node.right, node)
    end
  end

  def successor(node, node_to_delete)
    if node.left
      node.left = successor(node.left, node_to_delete)
      node
    else
      node_to_delete.data = node.data
      node.right
    end
  end

  def find(value, node = @root)
    return nil if node.nil?
    return node if node.data == value

    value < node.data ? find(value, node.left) : find(value, node.right)
  end

  def iterative_level_order(node = @root)
    return if node.nil?

    queue = Queue.new
    queue.enqueue(node)
    until queue.empty?
      current = queue.dequeue
      queue.enqueue(current.left) unless current.left.nil?
      queue.enqueue(current.right) unless current.right.nil?
      yield(current)
    end
  end

  def recursive_level_order(node = @root, queue = Queue.new, &block)
    return if node.nil?

    yield(node)
    queue.enqueue(node.left) unless node.left.nil?
    queue.enqueue(node.right) unless node.right.nil?
    recursive_level_order(queue.dequeue, queue, &block)
  end

  def preorder(node = @root, &block)
    return if node.nil?

    yield(node)
    preorder(node.left, &block)
    preorder(node.right, &block)
  end

  def inorder(node = @root, &block)
    return if node.nil?

    inorder(node.left, &block)
    yield(node)
    inorder(node.right, &block)
  end

  def postorder(node = @root, &block)
    return if node.nil?

    postorder(node.left, &block)
    postorder(node.right, &block)
    yield(node)
  end

  def depth(value, node = @root)
    return nil if node.nil?

    if node.data == value
      0
    elsif value < node.data
      next_depth = depth(value, node.left)
      next_depth.nil? ? nil : (1 + next_depth)
    elsif value > node.data
      next_depth = depth(value, node.right)
      next_depth.nil? ? nil : (1 + next_depth)
    end
  end

  def find_height(node = @root)
    return -1 if node.nil?

    left = find_height(node.left)
    right = find_height(node.right)
    1 + [left, right].max
  end

  def height(value, node = @root)
    return nil if node.nil?

    if node.data == value
      find_height(node)
    elsif value < node.data
      height(value, node.left)
    else
      height(value, node.right)
    end
  end

  def size
    size = 0
    inorder { |_| size += 1 }
    size
  end

  def balanced_recursive(node = @root)
    return [true, 0] if node.nil?

    left_balanced, left_height = balanced_recursive(node.left)
    right_balanced, right_height = balanced_recursive(node.right)

    balance_factor = (left_height - right_height).abs
    current_is_balanced = left_balanced && right_balanced && balance_factor <= 1

    current_height = 1 + [left_height, right_height].max

    [current_is_balanced, current_height]
  end

  def balanced?
    balanced_recursive[0]
  end

  def rebalance
    @array = []
    inorder { |node| @array << node.data }
    @array.uniq.sort
    @root = build_tree
  end
end
