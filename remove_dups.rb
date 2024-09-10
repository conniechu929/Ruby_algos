# remove duplicates with the two pointer algorithm
def remove_dups(nums)
  fast = 1
  slow = 0

  while fast < nums.length
    if nums[slow] == nums[fast]
      fast += 1
    else
      nums[slow+1] = nums[fast]
      slow += 1
    end
  end
  return nums
end