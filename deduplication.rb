# given an integer array nums, find all unique triplets 
# nums[i] + nums[j] + nums[k] = target where i, j, k are distinct
# Assume that you are given a function twoSum(nums, twoTarget) 
# that finds all unique sets of two numbers in nums that add up to twoTarget

# In the function we can take the first element from nums and use 
# twoSum to find the other two elements that make up the remain amount.
# Iterate over nums and for each element num, call twoSum on nums
# for the remaining amount of target - num

def three_sum(nums, target)
  nums.sort
  nums.each_with_index do |num, i|
    if i > 0 && nums[i-1] == nums[i]
      next #skip duplicate inputs
    end
    tuples = two_sum(nums[i+1..nums.length-1], target - nums[i]) #restrict two_sum's search interval
  end
end

# combination sum
# given an array of distinct integers candidates and a target integer target, 
# return a list of all unique combinations of candidates where
# the chosen numbers sum to target. You may return the combinations in any order.

# will need to establish order and pruning backward branches.
def combination_sum(candidates, target)
  result = []
  candidates.sort
  dfs_combo_sum(candidates, 0, target, [], result)
  return result
end

def dfs_combo_sum(nums, start_index, remaining, path, result)
  if remaining == 0
    result << path[0..path.length-1]
    return
  end
 
  for i in start_index..nums.length
    num = nums[i]
    # pruning the duplicate branches
    if remaining - num < 0
      next
    end

    dfs_combo_sum(nums, i, remaining - num, path + [num])
  end
end
