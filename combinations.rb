# Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.

# Example:

# Input: n = 4, k = 2
# Output:
# [
#   [2,4],
#   [3,4],
#   [2,3],
#   [1,2],
#   [1,3],
#   [1,4],
# ]

# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine(n, k)
    result = []
    arr = [*1..n]
    dfs(arr, k, 0, [], result)
    return result
end

def dfs(nums, combos, index, path, result)
    if combos < 0
        return
    end
    if combos == 0
        result << path
        return
    end
    for i in (index..nums.length-1)
        dfs(nums, combos-1, i+1, path+[nums[i]], result)
    end
end