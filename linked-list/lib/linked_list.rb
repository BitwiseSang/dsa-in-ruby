require_relative 'node'

# Linked list class
class LinkedList
  attr_accessor :head, :tail

  def initialize(head)
    @head = head
  end

  private

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

  public

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
    each { |_, _| size += 1 }
    size
  end

  def at(index)
    each_with_index { |node, idx| return node.value if index.eql?(idx) }
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
