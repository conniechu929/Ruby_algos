# Given a 2D board and a word, find if the word exists in the grid.

# The word can be constructed from letters of sequentially adjacent cell, where 
# "adjacent" cells are those horizontally or vertically neighboring. 
# The same letter cell may not be used more than once.

# Example:

# board =
# [
#   ['A','B','C','E'],
#   ['S','F','C','S'],
#   ['A','D','E','E']
# ]

# Given word = "ABCCED", return true.
# Given word = "SEE", return true.
# Given word = "ABCB", return false.

# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
    for i in (0..board.length-1)
        for j in (0..board[0].length-1)
            if dfs(board, i, j, word, [])
                return true
            end
        end
    end
    return false
end

def dfs(matrix, i, j, word, path)
    if !word or matrix[i][j] == word
        return true
    end
    if matrix[i][j] == word[0]
        for pos in [[i+1, j], [i-1, j], [i, j+1], [i, j-1]]
            if !path.include?(pos) and pos[0] >= 0 and pos[0] < matrix.length and pos[1] >= 0 and pos[1] < matrix[0].length
                if dfs(matrix, pos[0], pos[1], word[1..word.length], path+[[i,j]].uniq)
                    return true
                end
            end
        end
    end
    return false
end