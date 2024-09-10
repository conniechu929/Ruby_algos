# only works if the array is sorted
def binary_search(arr, target)
  left = 0
  right = arr.length-1
  while left <= right 
    mid = right+left/2
    if target == arr[mid]
      return mid
    end

    if arr[mid] < target
      left = mid + 1
    else
      right = mid - 1
    end
  end
  return -1
end

# find the first true in a sorted boolean array
# TEMPLATE
def find_boundary(arr)
  left = 0
  right = arr.length-1
  boundary_index = -1

  while left <= right
    mid = right+left/2
    if arr[mid]
      boundary_index = mid
      right = mid - 1
    else
      left = mid + 1
    end
  end

  return boundary_index
end


# finding the feasiable function in a binary search problem
# time: O(log(n))
# space: O(1)
def first_not_smaller(nums, target)
  left = 0
  right = nums.length-1
  boundary_index = -1

  while left <= right
    mid = right+left/2
    if nums[mid] >= target
      boundary_index = mid
      right = mid - 1
    else
      left = mid + 1
    end
  end

  return boundary_index
end

# find the element in sorted array with duplicates
# time: O(log(n))
# space: O(1)
def find_first_occurence(nums, target)
  left = 0
  right = nums.length-1
  boundary_index = -1

  while left <= right
    mid = right+left/2
    if nums[mid] == target
      boundary_index = mid
      right = mid - 1
    elsif nums[mid] > target
      right = mid - 1
    else
      left = mid + 1 
    end
  end

  return boundary_index
end

# given an int, find it's square root, and if no square root, return the largest number smaller
# than the target
def square_root(n, target)
  if n == 0
    return 0
  end

  left = 1
  right = n
  res = -1

  while left <= right
    mid = n/2
    if mid * mid == target
      return mid
    elsif mid * mid > target
      res = mid
      right = mid - 1
    else
      left = mid + 1
    end
  end

  return res - 1 
end

# find minimum in rotated sorted array
def find_min_rotated(nums)
  left = 0
  right = nums.length - 1
  boundary_index = -1

  while left <= right
    mid = left + right/2
    if nums[mid] <= nums[nums.length-1]
      boundary_index = mid
      right = mid - 1
    else
      left = mid + 1
    end  
  end
  return boundary_index
end


def peak_of_mountain_array(nums)
  n = nums.length
  left, right = 0, nums.length-1
  boundary_index = -1

  while left <= right
    mid = left+right/2
    if nums[mid] > nums[mid+1]
      boundary_index = mid
      right = mid - 1
    else
      left = mid + 1
    end
  end
  return boundary_index
end

# What is the minimum amount of time it would take to have your coworkers 
# go through all the newspapers? That is, if you optimize the distribution 
#  of newspapers, what is the longest reading time among all piles?
def feasiable(newspapers_read_times, num_coworkers, limit)
  time, num_workers = 0, 0
  for read_time in newspapers_read_times
    if time + read_time > limit
      time = 0
      num_workers += 1
    end
    time += read_time
  end

  if time != 0
    num_workers += 1
  end
  return num_workers <= num_coworkers
end

def newspapers_splits(newspapers_read_times, num_coworkers)
  low, high = newspapers_read_times.max, newspapers_read_times.sum
  ans = -1
  while low <= high
    mid = low+high/2
    if feasiable(newspapers_read_times, num_coworkers, mid)
      ans = mid
      high = mid -1
    else
      low = mid + 1
    end
  end
  return ans
end

