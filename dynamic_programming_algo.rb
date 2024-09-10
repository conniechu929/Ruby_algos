# Longest palindromic substring
# @param {String} s
# @return {String}
def longest_palindrome(s)
  # handle edge case which is even length
  res = ""
  res_len = 0
  for i in (0..s.length-1)
      # check odd length of s
      l, r = i, i
      while l >= 0 && r < s.length && s[l] == s[r]
          if (r - l + 1) > res_len
              res = s[l..r]
              res_len = r - l + 1
          end
          l -= 1
          r += 1
      end
      # check even length of s
      l, r = i, i + 1
      while l >= 0 && r < s.length && s[l] == s[r]
          if (r - l + 1) > res_len
              res = s[l..r]
              res_len = r - l + 1
          end
          l -= 1
          r += 1
      end
  end
  return res
end

# Coin change
# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
  ans = [0] + Array.new(amount, Float::INFINITY)

  for coin in coins
    for i in coin..amount
      ans[i] = [ans[i], ans[i-coin] + 1].min
    end
  end

  # we can only return it if it is not the default value
  ans[amount] == Float::INFINITY ? -1 : ans[amount] 
end

# Maximum product subarray
# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  res = nums.max
  curMin, curMax = 1,1 # set them to 1 first because 1 is neutral value

  for n in nums
      if n == 0
          curMin, curMax = 1,1
          next
      end
      temp = curMax  * n
      curMax = [n * curMax, n * curMin, n].max
      curMin = [temp, n * curMin, n].min
      res = [res, curMax].max
  end
  return res
end

# House Robber
# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  rob1, rob2 = 0, 0

  # [rob1, rob2, n, n + 1,...]
  # if we want to rob1 we need to add n first,
  # we can then store the max value into rob2
  for n in nums
      temp = [n + rob1, rob2].max
      rob1 = rob2
      rob2 = temp
  end
  return rob2
end

# House robber 2
# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  return [houseRobber1(nums[0..nums.length-2]), houseRobber1(nums[1..nums.length-1])].max
end

def houseRobber1(n)
  rob1, rob2 = 0, 0

  for i in n
      temp = [i + rob1, rob2].max
      rob1 = rob2
      rob2 = temp
  end
  return rob2

end

