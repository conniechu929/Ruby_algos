require 'set'

# Template of BFS on graph
def bfs_graph(root)
  queue = [root]
  visited = Set.new
  visited << root
  while queue.any?
    node = queue.shift
    for neighbor in get_neighbors(node)
      if neighbor in visited
        next
      end
      queue << neighbor
      visited.add(neighbor)
    end
  end
end

# BFS is by-level traversal
def bfs(root)
  queue = Queue.new(root)
  visited = Set.new
  visited << root
  level = 0
  while queue.any?
    n = queue.length # get # of nodes in the current level
    i = 0
    while i < n
      node = queue.shift 
      for neighbor in get_neighbors(node)
        if neighbor in visited
          next
        end
        queue << neighbor
        visited.add(neighbor)
      end
      i += 1
    end
    # increment level after we have processed all nodes of the level
    level += 1
  end
end

# DFS graph traversal
def dfs(root, visited)
  for neighbor in get_neighbors(root)
    if neighbor in visited
      next
    end
    visited.add(neighbor)
    dfs(neighbor, visited)
  end
end


# shortest path between A and B
# BFS question because it's asking for shortest path
# Given an (unweighted) connected graph, return the length of the 
# shortest path between two nodes A and B, in terms of the number of edges.
# Assume there always exists a path between nodes A and B.
# graph = [[1, 2], [0, 2, 3], [0, 1], [1]]
# A = 0
# B = 3
def shortest_path(graph, a, b)
  def get_neighbors(graph, node)
    return graph[node]
  end
  
  def bfs(graph, root, target)
    queue = [root]
    visited = Set.new
    visited << root
    level = 0
    while queue.length > 0
      n = queue.length
      i = 0
      while i < n
        node = queue.shift
        if node == target
          return level
        end
        for neighbor in get_neighbors(graph, node)
          if visited.include?(neighbor)
            next
          end
          queue << neighbor
          visited.add(neighbor)
        end
        i += 1
      end
      level += 1
    end
  end
  
  bfs(graph, a, b)
end



# Matrix as graph
# eg. Number of islands, Knight shortest path
# Template for matrix! to be used with BFS
num_rows, num_cols = grid.length, grid[0].length
def get_neighbors(coord, num_rows, num_cols)
  row, col = coord
  # this is cells right next to given coordinate
  delta_row = [-1, 0, 1, 0]
  delta_col = [0, 1, 0, -1]
  res = []
  delta_row.each_with_index do |dr, i|
    neighbor_row = row + dr
    neighbor_col = col + delta_col[i]
    if neighbor_row.between?(0, num_rows - 1) && neighbor_col.between?(0, num_cols - 1)
      res << [neighbor_row, neighbor_col]
    end
  end 
  return res
end


# Flood Fill
# Each entry of the matrix represents the color of a pixel. A flood fill 
# algorithm takes a coordinate r, c and a replacement color, and replaces all 
# pixels connected to r, c that have the same color (i.e., the pixels connected 
# to the given coordinate with same color and all the other pixels connected 
# to the those pixels of the same color) with the replacement color.
#  Input:
# r = 2
# c = 2
# replacement = 9
# arr = [[0,1,3,4,1],
      #  [3,8,8,3,3],
      #  [6,7,8,8,3],
      #  [12,2,8,9,1], 
      #  [12,3,1,3,2]
       # ]

# Output: [ [0,1,3,4,1],
          # [3,9,9,3,3],
          # [6,7,9,9,3],
          # [12,2,9,9,1],
          # [12,3,1,3,2]]

def flood_fill(image, r, c, replacement)
  num_rows = image.length
  num_cols = image[0].length

  def get_neighbors(coord, color, image, num_rows, num_cols)
    row, col = coord
    delta_row = [-1, 0, 1, 0]
    delta_col = [0, 1, 0, -1]
    neighbors = []
    delta_row.each_with_index do |dr, i|
      neighbor_row = row + dr
      neighbor_col = col + delta_col[i]
      if neighbor_row.between?(0, num_rows - 1) && neighbor_col.between?(0, num_cols - 1)
        if image[neighbor_row][neighbor_col] == color
          neighbors << [neighbor_row, neighbor_col]
        end
      end
    end
    neighbors
  end

  def bfs(root, replacement, image, num_rows, num_cols)
    queue = [root]
    visited = Array.new(num_rows) { Array.new(num_cols, false) }
    r, c = root
    color = image[r][c]
    image[r][c] = replacement # replace root color
    visited[r][c] = true
    while queue.any?
      node = queue.shift
      get_neighbors(node, color, image, num_rows, num_cols).each do |neighbor|
        nr, nc = neighbor
        unless visited[nr][nc]
          image[nr][nc] = replacement # replace color
          queue << neighbor
          visited[nr][nc] = true
        end
      end
    end
  end

  bfs([r, c], replacement, image, num_rows, num_cols)
  image
end

# Find the number of islands
# Given a 2-dimensional matrix of values with 0 and 1, count the number of islands of 1. 
# An island consists of all 1 value cells and is surrounded by either an edge or all 0 cells. 
# Cells can only be adjacent to each other horizontally or vertically, not diagonally.
def count_number_of_islands(grid)
  num_rows = grid.length
  num_cols = grid[0].length

  def get_neighbors(coord, grid, num_rows, num_cols)
    row, col = coord
    delta_row = [-1, 0, 1, 0]
    delta_col = [0, 1, 0, -1]
    neighbors = []
    delta_row.each_with_index do |dr, i|
      neighbor_row = row + dr
      neighbor_col = col + delta_col[i]
      if neighbor_row.between?(0, num_rows-1) && neighbor_col.between?(0, num_cols-1)
        neighbors << [neighbor_row, neighbor_col]
      end
    end
    neighbors
  end

  # build the bfs to visit the cells in the grid
  def bfs(grid, root, num_rows, num_cols)
    queue = [root]
    r, c = root[0], root[1]
    grid[r][c] = 0 #this is important to make that we visited the cell
    while queue.any?
      node = queue.shift
      get_neighbors(node, grid, num_rows, num_cols).each do |neighbor|
        nr, nc = neighbor
        if grid[nr][nc] == 0 # we visited the cell, so we should skip
          next 
        end
        queue << neighbor
        grid[nr][nc] = 0 
      end
    end
  end

  count = 0
  # because we iterate through every value in the grid we check if there could be islands
  for i in (0..num_rows-1)
    for j in (0..num_cols-1)
      if grid[i][j] == 0 
        next
      end
      bfs(grid, [i,j], num_rows, num_cols)
      count += 1 # BFS would find 1 connected island, increment count
    end
  end

  return count
end

# Knight Minimum moves
# On an infinitely large chessboard, a knight is located on [0, 0].
# A knight can move in eight directions.
# Given a destination coordinate [x, y], determine the minimum number of moves from [0, 0] to [x, y].
def get_knight_shortest_path(x, y)
  # there are now 8 edges to each cell because the knight can move in 8 directions
  def get_neighbors(coord)
    res = []
    row, col = coord
    # these deltas need to match on the grid
    delta_row = [-2, -2, -1, 1, 2, 2, 1, -1]
    delta_col = [-1, 1, 2, 2, 1, -1, -2, -2]
    delta_row.each_with_index do |dr, i|
      neighbor_row = row + dr
      neighbor_col = col + delta_col[i]
      res << [neighbor_row, neighbor_col]
    end
    res
  end

  def bfs(root, x, y)
    queue = [root]
    visited = Set.new
    visited << root
    steps = 0
    while queue.any?
      n = queue.length
      i = 0
      while i < n 
        node = queue.shift
        # x = col, y = rows
        if node[0] == y && node[1] == x # if we find our coords, terminate and return our steps
          return steps
        end
        get_neighbors(node).each do |neighbor|
          nr, nc = neighbor
          if visited.include?(neighbor)
            next
          end
          
          queue << neighbor
          visited << neighbor
        end
        i += 1
      end
      steps += 1
    end
  end
  
  bfs([0,0], x, y)
end

# Walls and Gates / Zombie in Matrix
@directions = [[0,1], [1,0], [0,-1], [-1,0]]
@INF = 2147483647 
def map_gate_distances(dungeon_map)
  queue = []
  n = dungeon_map.length
  m = dungeon_map[0].length

  for row in (0..n-1)
    for col in (0..m-1)
      if dungeon_map[row][col] == 0
        queue << [row, col]
      end
    end
  end

  while queue.any?
    node = queue.shift
    row, col = node[0], node[1]
    for item in directions
      total_row = node[0] + item[0]
      total_col = node[1] + item[1]
      if total_row >= 0 && total_row < n && total_col >= 0 && total_col < m 
        if dungeon_map[total_row][total_col] == @INF
          dungeon_map[total_row][total_col] = dungeon_map[row][col] + 1
          queue << [total_row, total_col]
        end
      end
    end
  end
  return dungeon_map
end

# Battleship
# @param {Character[][]} board
# @return {Integer}
def count_battleships(board)
  row, col = board.length, board[0].length
  count = 0

  # iterate through the board
  for r in (0..row-1)
      for c in (0..col-1)
          if board[r][c] == "X"
              count += 1
              dfs_battle(board, r, c)
          end
      end
  end
  count
end

def dfs_battle(board, i, j)
  return if i >= board.length || j >= board[0].length || i < 0 || j < 0 || board[i][j] == "."
  
  # set the found value to '.' now because at the top we counted the battleship already
  board[i][j] = '.'

  # continue to move down the 4 directions of the board
  # will need to DFS all 4 directions
  dfs_battle(board, i + 1, j)
  dfs_battle(board, i, j - 1)
  dfs_battle(board, i -1,j)
  dfs_battle(board, i,j + 1)
end

# open the lock
# Implicit graph

