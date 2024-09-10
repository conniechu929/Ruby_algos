def apply_operation(nums)
  i = 0
  while i < nums.length-1 
    if nums[i] == nums[i+1]
      nums[i] *= 2
      nums[i+1] = 0
    end
    i += 1
  end

  res = Array.new(nums.length, 0)
  n_index = 0
  for n in nums
    if n != 0
      res[n_index] = n
      n_index += 1
    end
  end
  return res
end