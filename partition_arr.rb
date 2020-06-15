# Given an array A, partition it into two (contiguous) subarrays left and right so that:

# Every element in left is less than or equal to every element in right.
# left and right are non-empty.
# left has the smallest possible size.
# Return the length of left after such a partitioning.  It is guaranteed that such a partitioning exists.

 

# Example 1:

# Input: [5,0,3,8,6]
# Output: 3
# Explanation: left = [5,0,3], right = [8,6]
# Example 2:

# Input: [1,1,1,0,6,12]
# Output: 4
# Explanation: left = [1,1,1,0], right = [6,12]

# @param {Integer[]} a
# @return {Integer}
def partition_disjoint(a)
    left = Array.new(a.length) {0}
    right = Array.new(a.length) {0}
    left_count = a[0]
    
    for i in (0..a.length-1)
        left_count = [left_count, a[i]].max
        left[i] = left_count
    end
    
    right_count = a[a.length-1]
    for i in (0..a.length-1).reverse_each
        right_count = [right_count, a[i]].min
        right[i] = right_count
    end
    
    for i in (1..a.length-1)
        if left[i-1] <= right[i]
            return i
        end
    end
end