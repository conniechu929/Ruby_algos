# Given a collection of candidate numbers (candidates) and a target number (target), 
# find all unique combinations in candidates where the candidate numbers sums to target.

# Each number in candidates may only be used once in the combination.

# Example 1:

# Input: candidates = [10,1,2,7,6,1,5], target = 8,
# A solution set is:
# [
#   [1, 7],
#   [1, 2, 5],
#   [2, 6],
#   [1, 1, 6]
# ]

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
    result = []
    nums = candidates.sort
    dfs(nums, target, 0, [], result)
    return result
end

def dfs(candidates, target, index, path, result)
    if target < 0
        return
    end
    if target == 0
        result << path
        return
    end
    
    for i in (index..candidates.length-1)
        if i > index and candidates[i] == candidates[i-1]
            next
        end

        if candidates[i] > target
            break
        end
        
        dfs(candidates, target-candidates[i], i+1, path+[candidates[i]], result)
    end
end