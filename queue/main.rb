require_relative 'lib/queue'

queue = Queue.new
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)
puts 'Queue after inserting elements'
puts queue

puts 'Getting the first element'
puts queue.dequeue
puts queue
