# Example 1:

# Input: m = 3, n = 2
# Output: 3
# Explanation:
# From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
# 1. Right -> Right -> Down
# 2. Right -> Down -> Right
# 3. Down -> Right -> Right

# Example 2:

# Input: m = 7, n = 3
# Output: 28

# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
    rows, cols = m, n
    
    arr_matrix = Array.new(cols+1) {Array.new(rows+1, 1)}
    
    (1..cols).each do |c|
        (1..rows).each do |r|
            elem_1 = arr_matrix[c-1][r]
            elem_2 = arr_matrix[c][r-1]
            
            arr_matrix[c][r] = elem_1 + elem_2
        end
    end
    return arr_matrix[cols-1][rows-1]
end