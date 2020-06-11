# Function Description

# Complete the closestNumbers function in the editor below. It must return an array of integers as described.

# closestNumbers has the following parameter(s):

# arr: an array of integers (unsorted)
# return:
#   Output the pairs of elements with the smallest difference. 
#   If there are multiple pairs, output all of them in ascending order, all on the same line with 
#   just a single space between each pair of numbers. 
#   A number may be part of two pairs when paired with its predecessor and its successor.

# Complete the closestNumbers function below.
def closestNumbers(arr)
    sorted = arr.sort
    result = [[sorted[0],sorted[1]]]
    min = sorted[1] - sorted[0]
    sorted.each_cons(2) do |a, b|
        if b-a < min
            result = []
            result << a
            result << b
            min = (b-a).abs()
        elsif b-a == min
            result << a
            result << b
        end    
    end
    result.map(&:to_i)
end