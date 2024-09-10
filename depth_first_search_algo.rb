class Node
  attr_accessor :val, :left, :right
  def initialize(val = 0, _left = nil, _right = nil)
      @val = val
      @left = _left
      @right = _right
  end
end

# looks through deep into tree before coming out to current node and look through another branch
def dfs(root, target)
  if root.nil?
    return nil
  end
  if root.val == target
    return root
  end

  left = dfs(root.left, target)
  if !left.nil?
    return left
  end
  
  return dfs(root.right, target)
end

# dfs template
def dfs_template(node, state)
  if node.nil?
    # can do something but this is base case
    return
  end

  left = dfs_template(node.left, state)
  right = dfs_template(node.right, state)
  
  # you can do some logic...
  return # return what you're trying to look for
end

# using return value (divide and conquer)
# getting the maximum value in binary tree
def dfs_divide_conquer(node)
  if node.nil?
    return node.val
  end

  left_max_val = dfs_divide_conquer(node.left)
  right_max_val = dfs_divide_conquer(node.right)
  return [left_max_val, right_max_val, node.val].max
end

# using global variable for getting max value binary tree
@max_val = MIN_VALUE #this is the root.val
def dfs_gv(node)
  if node.nil?
    return
  end

  if node.val > @max_val
    @max_val = node.val
  end

  # recurse
  dfs_gv(node.left)
  dfs_gv(node.right)
end

def get_max_val(root)
  dfs_gv(root)
  return @max_val
end

# get the max depth of a binary tree
def tree_max_depth(root)
  if root.nil?
    return 0
  else
    return dfs_helper(root) - 1
  end
end

def dfs_helper(root)
  if root.nil?
    return 0
  end

  # number of nodes in the longest path of the current subtree
  # is the max number of nodes of its two subtrees plus one for the current node
  return [dfs(root.left), dfs(root.right)].max + 1
end

# find the visible nodes. On the path from the root to that node, there isn't any node with
# a value higher than this node's value
def visable_tree_node(root)
  max_so_far = -1.0/0.0
  return dfs(root, max_so_far)
end

def dfs(root, max_so_far)
  if root.nil?
    return 0
  end

  total = 0
  if root.val >= max_so_far
    total += 1
  end

  total += dfs(root.left, [max_so_far, root.val].max)
  total += dfs(root.right, [max_so_far, root.val].max)

  return total
end

# balanced binary tree
# A binary tree is considered balanced if, for every node in the tree, 
# the difference in the height (or depth) of its left and right subtrees is at most 1.
def is_balanced(tree)
  return dfs_tree_height(tree) != -1
end

def dfs_tree_height(root)
  if root.nil?
    return 0
  end

  left_height = dfs_tree_height(root.left)
  right_height = dfs_tree_height(root.right)
  if left_height == -1 || right_height == -1
    return -1
  end

  if (left_height-right_height).abs > 1
    return -1
  end

  return [left_height, right_height].max + 1
end

# invert binary tree
# To "invert" a binary tree, switch the left subtree and the right subtree, 
# and invert them both. Inverting an empty tree does nothing.
def invert_binary_tree(tree)
  if tree.nil?
    return nil
  end

  return Node.new(tree.val, invert_binary_tree(tree.right), invert_binary_tree(tree.left))
end

# valid binary search tree
def valid_bst(root)
  def dfs(root, min_val, max_val)
    if root.nil?
      return true
    end

    if !(min_val < root.val < max_val)
      return false
    end

    return dfs(root.left, min_val, root.val) && dfs(root.right, root.val, max_val)
  end

  return dfs(root, -1.0/0.0, 1.0/0.0)
end

