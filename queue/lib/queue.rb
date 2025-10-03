# Queue implementation
class Queue
  def initialize
    @queue = []
  end

  def enqueue(value)
    @queue << value
  end

  def dequeue
    @queue.shift
  end

  def read
    @queue.first
  end

  def size
    @queue.size
  end

  def to_s
    print @queue
  end
end
