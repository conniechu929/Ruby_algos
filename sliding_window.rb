# sliding window is similar to two pointers moving in the same direction
def long_substr_wo_repeat_char(str)
  longest = 0
  left = 0
  counter = {}
  i = 0
  while i < str.length do
    counter[str[i]] += 1
    while counter[str[i]] > 1 do
      counter[str[i]] -= 1
      left += 1
    end
    longest = [longest, i-left+1].max
  end 
  return longest
end

# template for sliding window
def sliding_window_flexible_longest(input):
  window, ans = {}, 0
  left = 0
  for right in 0..input.length-1 do
      append input[right] to window
      while invalid(window):        # update left until window is valid again
          remove input[left] from window
          left += 1
        end
    ans = [ans, right - left + 1].max        # window is guaranteed to be valid here
  end   
  
  return ans
end

# find the largest subarray sum
def largest_subarray_sum(nums, target)
  window_sum, ans = 0, 0
  left = 0
  for right in 0..nums.length-1 do
    window_sum += nums[right]
    while window_sum > target do
      window_sum -= nums[left]
      left += 1
    end
    ans = [ans, right-left+1].max
  end
  return ans
end