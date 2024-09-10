def game_of_life(board)
  m = board.length
  n = board[0].length
  directions = [
    [-1, -1], [-1, 0], [-1, 1],
    [0, -1],           [0, 1],
    [1, -1], [1, 0], [1, 1]
  ]

  # Create a copy of the board to store the next state
  next_state = Array.new(m) { Array.new(n, 0) }

  (0...m).each do |i|
    (0...n).each do |j|
      live_neighbors = 0

      directions.each do |di, dj|
        ni, nj = i + di, j + dj
        if ni >= 0 && ni < m && nj >= 0 && nj < n && board[ni][nj] == 1
          live_neighbors += 1
        end
      end

      if board[i][j] == 1
        if live_neighbors < 2 || live_neighbors > 3
          next_state[i][j] = 0
        else
          next_state[i][j] = 1
        end
      else
        if live_neighbors == 3
          next_state[i][j] = 1
        end
      end
    end
  end

  # Copy the next state back to the original board
  (0...m).each do |i|
    (0...n).each do |j|
      board[i][j] = next_state[i][j]
    end
  end

  board
end

# Example usage:
board = [
  [0, 1, 0],
  [0, 0, 1],
  [1, 1, 1],
  [0, 0, 0]
]

next_state = game_of_life(board)
next_state.each { |row| p row }

# Explanation:
# 1. Initialization: We initialize the dimensions of the board m and n, and define the possible directions to check for neighbors.
# 2. Next State Calculation: We create a copy of the board to store the next state. For each cell, we count the number of live neighbors.
# 3. Applying Rules: Based on the number of live neighbors, we update the cell's state according to the rules of the Game of Life.
# 4. Updating the Board: Finally, we copy the next state back to the original board.
# This implementation ensures that the rules are applied simultaneously to every cell, and the next state is calculated correctly.