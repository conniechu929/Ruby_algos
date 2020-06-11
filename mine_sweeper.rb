# figure out where there are bombs
# assume there are no duplicates in the array
# mine_sweeper([[0,0], [0,1]], 3, 4)
# output :
# [
#  [-1, -1, 1, 0],
#  [2, 2, 1, 0],
#  [0, 0, 0, 0]
# ]

def mine_sweeper(bombs, num_rows, num_cols)
    result = Array.new(num_rows) {[0] * num_cols}

    for a,b in bombs do
        row_i, col_i = a, b 
        result[row_i][col_i] = -1
 
        for i in (row_i - 1..row_i + 1) do
            for j in (col_i - 1..col_i + 1) do
                if (i >= 0 and i < num_rows) and (j >= 0 and j < num_cols) and result[i][j] != -1
                    result[i][j] += 1
                end
            end
        end
        
    end
    result
end

# because a search problem DFS/BFS
def click(field, num_row, num_cols, given_i, given_j)
    queue = []
    
    if field[given_i][given_j] == 0
        field[given_i][given_j] = -2
        queue << [given_i, given_j]
    else
        return field
    end

    while !queue.empty?
        current_i, current_j = queue.shift[0], queue.shift[1]

        for i in (current_i - 1..current_i + 1)
            for j in (current_j - 1..current_j + 1)
                if (i >= 0 and i < num_rows) and (j >= 0 and j < num_cols) and field[i][j] == 0
                    field[i][j] = -2
                    queue << [i, j]
                end
            end
        end
    end
    field
end