# a matrix is a 2D array
def transpose_matrix(matrix)
  # first get the length of the row
  rowCount = matrix.length
  # get a column length
  columnCount = matrix[0].length
  # create a prefilled transposed matrix. When we transpose a matrix it means that the
  # items in the matrix will be the length of the inner array
  # and the inner array will be the size of the outer array
  # e.g. [[1,2,3],[4,5,6]] => [[1,4],[2,5],[3,6]]
  transposedMatrix = Array.new(columnCount, 0).map{|n| Array.new(rowCount, 0)}

  i = 0
  while i < columnCount do
      j = 0
      while j < rowCount do
          transposedMatrix[i][j]= matrix[j][i]
          j+= 1
      end
      i += 1
  end 
  return transposedMatrix
end