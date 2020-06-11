# Given a m x n matrix, if an element is 0, 
# set its entire row and column to 0. Do it in-place.

# Example 2:

# Input: 
# [
#   [0,1,2,0],
#   [3,4,5,2],
#   [1,3,1,5]
# ]
# Output: 
# [
#   [0,0,0,0],
#   [0,4,5,0],
#   [0,3,1,0]
# ]

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
    mark = []
        
    matrix.each_with_index do |m, i|
        m.each_with_index do |ele, j|
           if ele == 0
                mark << [i,j]
           end
        end
    end
    
    for i,j in mark
       matrix[i].map! {|e| e = 0}
       for m in (0..matrix.length-1)
            matrix[m][j] = 0
       end    
    end
end