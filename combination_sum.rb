# Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), 
# find all unique combinations in candidates where the candidate numbers sums to target.

# The same repeated number may be chosen from candidates unlimited number of times.
# Example 1:

# Input: candidates = [2,3,6,7], target = 7,
# A solution set is:
# [
#   [7],
#   [2,2,3]
# ]

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
    candidates.sort
    result = []
    dfs(candidates, target, 0, [], result)
    return result
end

def dfs(nums, target, index, path, result)
    if target < 0
        return
    end
    if target == 0
        result << path
        return
    end
    
    for i in (index..nums.length-1)
        dfs(nums, target-nums[i], i, path+[nums[i]], result)
    end
end