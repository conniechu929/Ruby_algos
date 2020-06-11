def bfs(adj_matrix, source, terminal)
    node_queue = [source]
  
    loop do
      current_node = node_queue.pop
      return false if current_node == nil
      return true if current_node == terminal
  
      children = (0..adj_matrix.length-1).to_a.select do |i|
        adj_matrix[current_node][i] == 1
      end
  
      node_queue = children + node_queue
    end
  end
  
  adj_matrix = [
    [0, 0, 1, 0, 1, 0],
    [0, 0, 1, 0, 0, 1],
    [0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 1, 1],
    [0, 0, 1, 0, 1, 0],
    [0, 1, 0, 0, 0, 0]
  ]
  
  p bfs(adj_matrix, 0, 4)