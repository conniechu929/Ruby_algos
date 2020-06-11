# Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).

# Note: The solution set must not contain duplicate subsets.

# Example:

# Input: [1,2,2]
# Output:
# [
#   [2],
#   [1],
#   [1,2,2],
#   [2,2],
#   [1,2],
#   []
# ]

# @param {Integer[]} nums
# @return {Integer[][]}
def subsets_with_dup(nums)
    result = []
    arr = nums.sort
    dfs(arr, 0, [], result)
    return result
end

def dfs(arr, index, path, result)
    result << path
    for i in (index..arr.length-1)
        if i > index and arr[i] == arr[i-1]
            next
        end
        dfs(arr, i+1, path+[arr[i]], result)
    end
end