# given a set of distinct integers, nums, return all possible subsets
# the solution set must not contain duplicate subsets
def subsets(nums)
  result = []
  dfs_subsets(nums, 0, [], result)
  return result
end

def dfs_subsets(nums, start_index, path, result)
  if start_index == nums.length
    result << path
    return
  end

  dfs_subsets(nums, start_index+1, path + [nums[start_index]], result)
  dfs_subsets(nums, start_index+1, path, result)
end

# pruning backward branches for combination sum
def pruning_subsets(nums)
  result = []
  dfs_pruning_subsets(nums, 0, [], result)
  return result
end

def dfs_pruning_subsets(nums, start_index, path, result)
  result << path[0..nums.length-1]
  for num_index in (start_index..nums.length)
    path << nums[nums_index]
    dfs_pruning_subsets(nums, num_index+1, path)
    path.pop
  end
end