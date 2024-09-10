require 'thread'

class ResourcePool
  def initialize(resources)
    @resources = resources
    @available_resources = Queue.new
    @mutex = Mutex.new

    # Initialize the queue with the provided resources
    resources.each { |resource| @available_resources.push(resource) }
  end

  # Check out a resource from the pool
  def checkout
    @mutex.synchronize do
      if @available_resources.empty?
        raise "No resources available"
      else
        @available_resources.pop
      end
    end
  end

  # Return a resource to the pool
  def checkin(resource)
    @mutex.synchronize do
      @available_resources.push(resource)
    end
  end

  # Check if the pool is empty
  def empty?
    @available_resources.empty?
  end

  # Get the number of available resources
  def size
    @available_resources.size
  end
end

# Example usage:
# resources = ["Resource1", "Resource2", "Resource3"]
# pool = ResourcePool.new(resources)
# resource = pool.checkout
# pool.checkin(resource)
