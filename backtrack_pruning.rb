# backtracking w/prunning and additional states
def dfs(start_index, path, [...additional_states])
  if is_leaf(start_index)
    ans << path[0..end] # add a copy of the path to the result
    return
  end

  for edge in get_edges(start_index, [...additional_states])
    # prune if needed
    if !is_valid(edge)
      next
    end

    path.add(edge)
    if additional_states
      update(...additional_states)
    end
    dfs(start_index+edge.length, path, [...additional_states])
    if additional_states
      revert(...additional_states)
    end
    path.pop
  end
end

# template for pruning
def dfs(start_index, path)
  if is_leaf(start_index)
    report(path)
    return
  end

  for edge in get_edges(start_index)
    # prune if needed
    if !is_valid(edge)
      next
    end
    path.add(edge)
    # increment start_index
    dfs(start_index+edge.length, path)
    path.pop
  end
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

# Partitioning a string into palindromes
def partition(s)
  result = []
  n = s.length
  dfs_partition(n, 0, [])
  return result
end

def is_palindrome(word)
  return word == word.reverse
end

def dfs_partition(num, start_index, path)
  if start_index == num
    res << path[0..-1]
    return
  end

  for i in start_index+1..num do
    prefix = s[start_index..i]
    if is_palindrome(prefix)
      path << prefix
      dfs_partition(i, path)
    end
  end
end


# generate all valid parentheses
def generate_parentheses(n)
  result = []
  dfs_parens(n, 0,[], 0, 0, result)
  return result
end

def dfs_parens(n, start_index, path, open_count, close_count, res)
  if start_index == 2 * n
    res << path.join("")
    return
  end

  if open_count < n
    path << "("
    dfs_parens(n, start_index + 1, path, open_count+1, close_count, res)
    path.pop
  end

  if close_count < open_count
    path << ")"
    dfs_parens(n, start_index+1, path, open_count, close_count+1, res)
    path.pop
  end
end

# generate all permutations
def permutations(letters)
  result = []
  dfs_permutation(letters, 0, [], Array.new(letters.length, false), result)
  return result
end

def dfs_permutation(letters, start_index, path, used, res)
  if start_index == letters.length
    res << path.join("")
    return
  end

  letters.each_char.with_index do |ch, i|
    # skip used letter
    if used[i]
      next
    end
    path << ch
    used[i] = true
    dfs_permutation(letters, start_index+1, path, used, result)
    # remove letter from permutation, mark letter as unused
    path.pop
    used[i] = false
  end
end

