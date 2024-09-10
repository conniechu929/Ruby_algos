# Design an algorithm to encode a list of strings to a string. 
# The encoded string is then sent over the network and is decoded back to the original list of strings.

# Please implement encode and decode
def encode(str)
  res = ""
  str.each do |s|
    res << s.length.to_s + "#" + s
  end
  res
end

def decode(str)
  res, i = [], 0

  # our string looks like "4#love3#you"
  while i < str.length
    j = i
    while str[j] != "#"
      j += 1
    end
    len = str[i..j-1].to_i
    res << str[j+1..j + 1 + len-1]
    i = j + 1 + len
  end
  
  return res
end

# Anagrams
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  # t_hash = {}
  # s_hash = {}
  # # quick exit
  # if s.length != t.length
  #     return false
  # end

  # i = 0
  # # s_str = s.split("")
  # # t_str = t.split("")
  # while i < s.length
  #     if !s_hash[s[i]]
  #         s_hash[s[i]] = 1
  #     end
      
  #     if !t_hash[t[i]]
  #         t_hash[t[i]] = 1 
  #     end

  #     s_hash[s[i]] += 1
  #     t_hash[t[i]] += 1
  #     i += 1
  # end

  # if s_hash == t_hash
  #     return true
  # end

  # return false

  return true if s.split('').sort.join == t.split('').sort.join
  false
end

# Group Anagrams
# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  # initialize hash with empty list value
  res = Hash.new{|h, k| h[k] = []}

  for s in strs
      count = Array.new(26, 0)
      s.each_char do |c|
          # use ascii values and since we want to start at 0,
          count[c.ord - "a".ord] += 1
      end
      res[count] << s
      
  end
  return res.values
end

# Longest substring without repeating characters
# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  # use ruby Set.new() because it will not include duplicates
  char_set, ans = Set.new(), 0
  # beginning of the window
  l = 0

  for r in (0..s.length-1)
      while char_set.include?(s[r]) 
          # remove the left move character
          char_set.delete(s[l])
          l += 1
      end
      char_set.add(s[r])
      ans = [ans, r - l + 1].max
  end
  return ans
end

# Top K frequency
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  # use an array where the index indicates the frequency it shows
  # up in the array nums. The value will be the actual number
  # in the nums array 
  count = {}
  # our freq needs to be the nums length + 1 because our nums start with value 1
  # our nums array will not have value 0
  freq = Array.new(nums.length+1) { Array.new() }
 
 for n in nums
  # from the hash get the key n with value 0. If it doesn't exist, it'll create it
  # in the count hash
  count[n] = 1 + count.fetch(n, 0)
 end

  # iterate through the count hash and add the value counts into the freq array
  # i.e 1 has count of 3, so in freq[3] we add 1 to become [1]
  # do this for all the count and values
 count.each do |n, c|
  freq[c] << n
 end

  # because we want the most frequent, we start at the end of the freq array
  # we iterate through the values at each freq and add the n value to res
  # until we have k length for res
 res = []
 (freq.length-1).downto(0) do |i|
      for n in freq[i]
          res << n
          if res.length == k
              return res
          end
      end
 end
end

# Two sum
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  result = {}
  nums.each_with_index do |val, i|
      if result[target - val]
          return [i, result[target-val]]
      end
      result[val] = i
  end
end

# Product of array except self
# need to do it in O(n) time and without using division operation
def product_except_self(nums)
end