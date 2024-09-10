# Lowest common ancestor (LCA) of two nodes v and w in a tree is the lowest (i.e., deepest)
# node that has both v and w as descendants. We also define each node to be a descendant of itself 
# (so if v has a direct connection to w, w is the lowest common ancestor).

class Node
  attr_accessor :val, :left, :right
  def initialize(val = 0, _left = nil, _right = nil)
      @val = val
      @left = _left
      @right = _right
  end
end

# Given two nodes of a binary tree, find their lowest common ancestor.
def lca(root, node1, node2)
  if root.nil?
    return nil
  end

  # case 2: root is either node1 or node2
  if root == node1 || root == node2
    return root
  end
  left = lca(root.left, node1, node2)
  right = lca(root.right, node1, node2)

  # case 1: nodes are found in both left and right subtrees
  if left != nil && right != nil
    return root
  end

  # case 4 and 5: report target node or LCA back to parent
  if left != nil 
    return left
  end

  if right != nil 
    return right
  end

  # case 3: not found, return nil
  return nil
end