# example of memoization with fibbonacci number
def fib(n, memo)
  if memo.key?(n)
    return memo[n]
  end

  if n == 0 || n == 1
    return n
  end

  res = fib(n-1) + fib(n-2)
  memo[n] = res
  return res
end


# template backtracking to aggregate return values
def dfs(start_index, [...additional_states])
  if is_leaf(start_index)
    return 1
  end

  ans = initial_value
  for edge in get_edges(start_index, [...additional_states])
    if additional_states
      update([...additional_states])
    end

    ans = aggregate(ans, dfs(start_index+edge.length, [...additional_states]))
    if additional_states
      revert([...additional_states])
    end

    return ans
  end
end

# word break
# given a string and a list of words, determine if the string can be constructed from
# concatenating words from the list of words
def word_breaks(s, words)
  return dfs_wordbreak(s, words, 0)
end

def dfs_wordbreak(str, words, start_index)
  # exit because we have constructed the entire target
  if start_index == str.length
    return true
  end

  ans = false
  words.each do |w|
    if str[start_index..start_index+w.length].start_with?(w)
      ans = ans || dfs_wordbreak(str, words, start_index+w.length)
    end
  end

  return ans
end

# WORD BREAK USING MEMOIZATION
def word_break(s, words)
  memo = {}
  return dfs_wordbreak(s, words, memo, 0)
end

def dfs_wordbreak(target, words, memo, start_index)
  if start_index == target.length
    return true
  end

  if memo.key?(start_index)
    return memo[start_index]
  end

  ans = false
  words.each do |w|
    if target[start_index..start_index+w.length].start_with?(w)
      if dfs_wordbreak(target, words, memo, start_index+w.length)
        ans = true
        break
      end
    end
  end

  memo[start_index] = ans
  return ans
end

# number of ways to decode a message
# given a non-empty string of digits, how many ways are there to decode it?
def decode_ways(digits)
  return dfs_decode(digits, 0)
end

def dfs_decode(digits, start_index)
  if start_index == digits.length
    return 1
  end

  ways = 0
  # can't decode string with leading 0
  if digits[start_index] == "0"
    return ways
  end
  # decode one digit
  ways += dfs_decode(digits, start_index+1)
  # decode two digits
  if 10 <= digits[start_index..start_index+2].to_i <= 26
    ways += dfs_decode(start_index + 2)
  end

  return ways
end

# USE MEMOIZATION TO DECODE WAYS
def memo_decode_ways(digits)
  memo = {}
  memo[digits.length] = 1 # considering the entire string as 1 way to decode which serves as the base
  return dfs_memo_decode(digits, 0, memo)
end 

def dfs_memo_decode(digits, start_index, memo)
  if start_index == digits.length
    return 1
  end
  
  if memo[start_index]
    return memo[start_index]
  end

  # to get the number of ways either we consider current value or 
  # we consider both the values since that's when it will be less than or equal
  # to 26 letters.

  ways = 0
  # can't decode string with leading 0
  if digits[start_index] == "0"
    return ways
  end

  # decode one digit
  ways += dfs_memo_decode(digits, start_index+1, memo)

  # decode two digits
  if (start_index + 1 < digits.length) && (digits[start_index] == "1") || (digits[start_index] == "2" && ("0".."6").include?(digits[start_index+1])) 
    ways += dfs_memo_decode(digits, start_index+2, memo)
  end

  memo[start_index] = ways
  return ways
end

# minimum number of coins to make up given value
def coin_change(coins, amount)
  result = min_coins(coins, amount, 0)
  if result != 1/0.0
    return result
  else
    return -1
  end
end

def min_coins(coins, amount, sum)
  if sum == amount
    return 0
  end

  if sum > amount
    return 1.0/0.0
  end

  ans = 1.0/0.0
  coins.each do |coin|
    result = min_coins(coins, amount, sum + coin)
    if result == 1.0/0.0
      next
    end
    ans = [ans, result + 1].min
  end
  return ans
end

# MEMOIZATION OF MINIMUM NUMBER OF COINS
def memo_coin_change(coins, amount)
  memo = Array.new(amount+1, Float::INFINITY)
  result = memo_min_coins(coins, amount, 0, memo)
  if result != 1.0/0.0
    return result
  else
    return -1
  end
end

def memo_min_coins(coins, amount, sum, memo)
  if sum == amount
    return 0
  end

  if sum > amount 
    return 1.0/0.0
  end

  if memo[sum] != -1
    return memo[sum]
  end

  ans = 1.0/0.0
  coins.each do |coin|
    result = memo_min_coins(coins, amount, sum+coin, memo)
    if result == 1.0/0.0
      next
    end
    ans = [ans, result+1].min
  end
  memo[sum] = ans
  return ans
end

# coin change use DFS template
def coin_change(coins, total)
  change = Array.new(total+1, 99999999)
  change[0] = 0
  coins.each.with_index do |coin, i|
      (1...change.length).each do |amount|
          change[amount] = [change[amount], change[amount-coin]+1].min if coin <= amount
      end    
  end
  return change[total] == 99999999 ? -1 : change[total]
end 

def coin_change(coins, amount)
  ans = [0] + Array.new(amount, Float::INFINITY)

  for coin in coins
    for i in coin..amount
      ans[i] = [ans[i], ans[i-coin] + 1].min
    end
  end

  ans[amount] == Float::INFINITY ? -1 : ans[amount]
end