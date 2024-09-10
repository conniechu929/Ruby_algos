# template for backtracking
def dfs_backtracking(start_index, path)
  # start_index is used to keep track of the current level of the state-space tree we are in
  if is_leaf(start_index)
    report(path)
    return
  end
  # edge is the choice we make
  for edge in get_edges(start_index)
    path.add(edge)
    dfs_backtracking(start_index+1, path)
    path.pop
  end
end

# Combinatorial problems
# given a non-negative integer n, find all n-letter words composed by 'a' and 'b'
# return them in a list of strings in lexicographical order
# input: 2
# output: ["aa", "ab", "ba", "bb"]
# input: 4
# output: ["aaaa", "aaab", "aaba", "aabb", "abaa", "abab", "abba", "abbb", "baaa", "baab", "baba", "babb", "bbaa", "bbab", "bbba", "bbbb"]
def letter_combination(n)
  result = []
  dfs_combo(0, n, [], result)
  return result
end

def dfs_combo(start_index, int, path, res)
  if start_index == int
    res << path.join("")
    return
  end

  ["a", "b"].each do |ch|
    path << ch
    dfs_combo(start_index+1, int, path, res)
    path.pop
  end
end


# Generate all letter combinations from a phone number
# given a phone number that contains digits 2-9, find all possible letter combinations
# the phone number could translate to
# input: "56"
# output: ["jm","jn","jo","km","kn","ko","lm","ln","lo"]


@keyboard = {
  "2": "abc",
  "3": "def",
  "4": "ghi",
  "5": "jkl",
  "6": "mno",
  "7": "pqrs",
  "8": "tuv",
  "9": "wxyz",
}

def letter_combination_of_phone_number(digits)
  result = []
  dfs_letter_combo(0, [], digits, result)
  return res
end

def dfs_letter_combo(start_index, path, input, res)
  if start_index == input.length
    res << path.join("")
    return
  end

  next_number = input[start_index]
  @keyboard[next_number].each do |k|
    path << keep
    dfs_letter_combo(start_index+1, path, input, res)
    path.pop
  end
end