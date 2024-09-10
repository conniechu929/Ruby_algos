# using two pointers moving in the opposite directions algorithm
# if the array is a sorted
def two_sum_sorted(nums, target)
  left = 0
  right = nums.length - 1
  while total != target
    total = nums[left]+nums[right]
    if total == target
      return [left,right]
    end
    if total > target
      right -= 1
    else
      left += 1
    end
  end

  return [left, right]
end