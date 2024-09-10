def oranges_rotting(grid)
  # get number of rows and columns in the grid
  rows, cols = grid.length, grid[0].length
  
  queue = []
  fresh_count = 0
  # track the number of minutes passed
  minutes_passed = 0

  # go through each cell in the grid
  for i in (0...rows)
    for j in (0...cols)
        o = grid[i][j]
      # find the rotten oranges and add the position to the queue
      if o == 2
        queue << [i,j]
      # if it is a fresh orange we add it to the fresh_count
      elsif o == 1
        fresh_count += 1
      end
    end
  end


  # directions in the grid that we can move
  directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]

  # Perform BFS until the queue is empty or there is no more fresh oranges left
  while queue.any? && fresh_count > 0
    # loop over all the rotten oranges at the current minute
    queue.count.times do
      ro = queue.shift
      x, y = ro[0], ro[1]

      # check the adjacent cells in all four directions
      directions.each do |dr, dc|
        newX = x + dr
        newY = y + dc

        # if the adjacent cell has a fresh orange, convert it to rotten
        if newX < 0 || newY < 0 || newX >= rows || newY >= cols || grid[newX][newY] != 1
            next
        end

        grid[newX][newY] = 2
        # add the new rotten orange to queue
        queue << [newX, newY]
        # decrease the fresh orange count
        fresh_count -= 1
      end
    end
    minutes_passed += 1
  end

  fresh_count.zero? ? minutes_passed : -1
end

# @param {Integer[][]} grid
# @return {Integer}
def oranges_rotting(grid)
  rows, cols = grid.length, grid[0].length
    
  queue = []
  fresh_count = 0
  # track the number of minutes passed
  minutes_passed = 0

  # go through each cell in the grid
  for i in (0...rows)
    for j in (0...cols)
        o = grid[i][j]
      # find the rotten oranges and add the position to the queue
      if o == 2
        queue << [i,j]
      # if it is a fresh orange we add it to the fresh_count
      elsif o == 1
        fresh_count += 1
      end
    end
  end


  # directions in the grid that we can move
  directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]

  # Perform BFS until the queue is empty or there is no more fresh oranges left
  while queue.any? && fresh_count > 0
    # loop over all the rotten oranges at the current minute
    queue.count.times do
      ro = queue.shift
      x, y = ro[0], ro[1]

      # check the adjacent cells in all four directions
      directions.each do |dr, dc|
        newX = x + dr
        newY = y + dc

        # if the adjacent cell has a fresh orange, convert it to rotten
        if newX < 0 || newY < 0 || newX >= rows || newY >= cols || grid[newX][newY] != 1
            next
        end

        grid[newX][newY] = 2
        # add the new rotten orange to queue
        queue << [newX, newY]
        # decrease the fresh orange count
        fresh_count -= 1
      end
    end
    minutes_passed += 1
  end

  fresh_count.zero? ? minutes_passed : -1
end