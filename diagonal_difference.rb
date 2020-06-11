# Complete the 'diagonalDifference' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY arr as parameter.
#

def diagonalDifference(arr)
    # Write your code here
    len = arr.length - 1
    res_1 = []
    res_2 = []
    arr.each_with_index do |a, index|
        res_1 << a[index]
        res_2 << a[len - index]
    end
    (res_1.sum() - res_2.sum()).abs()
end