def dfs(adj_matrix, source, terminal)
    node_stack = [source]

    loop do
      current_node = node_stack.pop
      return false if current_node == nil
      return true if current_node == terminal
  
      children = (0..adj_matrix.length-1).to_a.select do |i|
        adj_matrix[current_node][i] == 1
      end
  
      node_stack += children
    end
  end
  
  adj_matrix = [
    [1, 0, 1, 0, 1, 0],
    [0, 0, 1, 0, 0, 1],
    [0, 0, 0, 1, 0, 0],
    [0, 1, 0, 0, 1, 1],
    [0, 0, 1, 0, 0, 0],
    [0, 0, 1, 1, 0, 0]
  ]
  
  p dfs(adj_matrix, 0, 3)

  def dfs_visited(adj_matrix, source, terminal)
    # node_stack = [source]
    # visited = {}

    # loop do
    #   current_node = node_stack.pop
    #   return false if current_node.nil?
    #   return true if current_node == terminal

    #   children = (0..adj_matrix.length - 1).to_a.select do |i|
    #     if visited[i]
    #       puts 'cyclic graph'
    #     end
   
    #     adj_matrix[current_node][i] == 1
    #   end
    #   node_stack += children
    #   visited[current_node] = true
    # end
    node_stack = [source]
    visited = Array.new(adj_matrix.size) {[0]}
    for i in adj_matrix do
      
    end

    
  end

  def dfs_color_graph(graph, color, parent)
    for child in graph[parent] do
      if color[child] == -1
        color[child] = 1 - color[parent]
        if !dfs_color_graph(graph, color, child)
          return false
        end
      elsif color[child] == color[parent]
        return false
      end
    end
    return true
  end

  def isCyclic()