# Number of unique paths to go from top left to bottom right
# given a grid m x n (m = row, n = col)

def unique_paths(m, n)
  # we need to prepopulate the grid with the number of ways we can reach
  # each cell
  dp = Array.new(m, 0) { Array.new(n, 0) }

  # fill in the first row as one because there's only one way to get to these cells
  for r in (0..m-1)
    dp[r][0] = 1
  end

  # fill the first column as one because there's only one way to get to these cells
  for c in (0..n-1)
    dp[0][c] = 1
  end

  for r in (1..m-1)
    for c in (1..n-1)
      dp[r][c] = dp[r-1][c] + dp[r][c-1]
    end
  end

  return dp[-1][-1]
end

# Minimal path sum
# given m x n matrix filled with non-negative integers, find a path
# from top left corner to bottom right corner which minimizes the sum of all nums along its path
def min_path_sum(grid)
  # the cells now have a weight we need to account for
  m = grid.length
  n = grid[0].length

  dp = Array.new(m, 0) {Array.new(n,0)}
  # take the first value from grid and add to our dp
  dp[0][0] = grid[0][0]
  
  # minimum path sum for the first column
  for r in (1..m-1)
    # need to set into dp by getting the cell from above and adding to our current cell
    dp[r][0] = dp[r-1][0] + grid[r][0]
  end

  # minimum path sum for the first row
  for c in (1..n-1)
    # need to set into dp by getting the cell from the left and adding to our current cell
    dp[0][c] = dp[0][c-1] + grid[0][c]
  end

  # calculate the minimum path sum of the other cells
  for r in (1..m-1)
    for c in (1..n-1)
      # as we iterate we get the min by comparing cell above and below, and adding the current cell
      dp[r][c] = [dp[r-1][c], dp[r][c-1]].min + grid[r][c]
    end
  end

  return dp[m-1][n-1]
end

# Triangle
# find the minimum path sum from top to bottom if given a triangle
def minimum_total(triangle)
  
end