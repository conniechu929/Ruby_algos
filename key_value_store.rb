class KeyValueStore
  def initialize
    # initialize an empty store
    @store = {}
    # initialize an empty transaction stack
    @transactions = []
  end

  def set(key, value)
    if @transactions.empty?
      @store[key] = value
    else
      current_transaction = @transactions.last
      current_transaction[:changes][key] = value
    end
  end

  def get(key)
    if @transactions.empty?
      @store[key]
    else
      current_transaction = @transactions.last
      current_transaction[:changes].fetch(key) { @store[key] }
    end
  end

  def delete(key)
    if @transactions.empty?
      @store.delete(key)
    else
      current_transaction = @transactions.last
      current_transaction[:changes].delete(key)
    end
  end

  def begin
    @transactions << { changes: {} }
  end

  def commit
    unless @transactions.empty?
      current_transaction = @transactions.pop
      current_transaction[:changes].each do |key, value|
        @store[key] = value
      end
    end
  end

  def rollback
    unless @transactions.empty?
      @transactions.pop
    end
  end

  def inspect
    @store.inspect
  end
end

# Example usage:
store = KeyValueStore.new
store.set('a', 1)
puts store.get('a') # => 1

store.begin
store.set('a', 2)
puts store.get('a') # => 2

store.begin
store.set('a', 3)
puts store.get('a') # => 3

store.rollback
puts store.get('a') # => 2

store.commit
puts store.get('a') # => 2
