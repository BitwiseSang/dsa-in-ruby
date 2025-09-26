require_relative 'node'

# Linked list class
class LinkedList
  attr_accessor :head, :tail

  def initialize(head)
    @head = head
  end

  def each(node = @head, &block)
    return if node.nil?

    yield node
    each(node.next_node, &block)
  end

  def each_with_index
    index = 0
    each do |node|
      yield node, index
      index += 1
    end
  end

  def append(value)
    if @tail.nil?
      @head.next_node = Node.new(value)
      @tail = @head.next_node
    else
      @tail.next_node = Node.new(value)
      @tail = @tail.next_node
    end
  end

  def prepend(value)
    current_head = @head
    @head = Node.new(value)
    @head.next_node = current_head
  end

  def size
    size = 0
    each { |_| size += 1 }
    size
  end

  def at(index)
    each_with_index { |node, idx| return node if index.eql?(idx) }
    nil
  end

  def pop
    each_with_index do |node, idx|
      if idx.eql?(size - 2)
        node.next_node = nil
        @tail = node
      end
    end
  end

  def contains?(value)
    each { |node| return true if node.value.eql?(value) }
    false
  end

  def find(value)
    each_with_index { |node, idx| return idx if node.value.eql?(value) }
    nil
  end

  def insert_at(value, index)
    each_with_index do |node, idx|
      next unless idx.eql?(index)

      previous_node = at(idx - 1)
      new_node = Node.new(value)

      # Updating node links
      new_node.next_node = node
      previous_node.next_node = new_node
    end
  end

  def remove_at(index)
    each_with_index do |node, idx|
      next unless idx.eql?(index)

      previous_node = at(idx - 1)
      # Updating node links
      previous_node.next_node = node.next_node
    end
  end

  def to_s
    puts "\n"
    each do |node|
      if node.next_node.nil?
        print "( #{node.value} ) -> nil"
      else
        print "( #{node.value} ) -> "
      end
    end
  end
end
