require 'thread'
require 'concurrent'

class QueueSystem
  def initialize
    @queue = Queue.new
    @workers = []
  end

  def add_worker(frequency)
    worker = Worker.new(@queue, frequency)
    @workers << worker
    worker.start
  end

  def add_to_queue(element)
    @queue << element
  end

  def stop
    @workers.each(&:stop)
  end
end

class Worker
  def initialize(queue, frequency)
    @queue = queue
    @frequency = frequency
    @running = false
  end

  def start
    @running = true
    @thread = Thread.new do
      while @running
        process_next_element
        sleep @frequency
      end
    end
  end

  def stop
    @running = false
    @thread.join
  end

  private

  def process_next_element
    element = @queue.pop(true) rescue nil
    return unless element

    # Process the element
    puts "Processing element: #{element}"
  end
end

# Example usage
queue_system = QueueSystem.new
queue_system.add_worker(1) # Add a worker that processes elements every 1 second
queue_system.add_to_queue("Task 1")
queue_system.add_to_queue("Task 2")
sleep(5) # Let the system run for a while
queue_system.stop
