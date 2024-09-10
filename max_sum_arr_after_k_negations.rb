# Given an array A of integers, we must modify the array in the following way: 
# we choose an i and replace A[i] with -A[i], and we repeat this process K times in total.  
# (We may choose the same index i multiple times.)

# Return the largest possible sum of the array after modifying it in this way.

# Example 1:

# Input: A = [4,2,3], K = 1
# Output: 5
# Explanation: Choose indices (1,) and A becomes [4,-2,3].

# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def largest_sum_after_k_negations(a, k)
    sorted = a.sort
    i = 0
    while k > 0
        sorted[i] = -sorted[i]
        if sorted[i] > sorted[i+1]
            i = i+1
        end
        k = k-1
    end
    return sorted.sum
end