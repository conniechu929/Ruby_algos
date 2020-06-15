# Given an array of integers, return the maximum sum for a non-empty subarray 
# (contiguous elements) with at most one element deletion. 
# In other words, you want to choose a subarray and optionally delete one element 
# from it so that there is still at least one element left and 
# the sum of the remaining elements is maximum possible.

# Note that the subarray needs to be non-empty after deleting one element.

 

# Example 1:

# Input: arr = [1,-2,0,3]
# Output: 4
# Explanation: Because we can choose [1, -2, 0, 3] and drop -2, 
# thus the subarray [1, 0, 3] becomes the maximum value.

# @param {Integer[]} arr
# @return {Integer}
def maximum_sum(arr)
    premax = Array.new(2) {[0]*arr.length}
    premax[0][0] = premax[1][0] = res = arr[0]
    
    for i in (1..arr.length-1)
        premax[0][i] = arr[i] + [0, premax[0][i-1]].max
        premax[1][i] = [premax[0][i], premax[0][i-1], arr[i] + [0, premax[1][i-1]].max].max
        res = [premax[0][i], res, premax[1][i]].max
    end
    return res
end