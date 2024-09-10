# ternary tree paths
# given a ternary tree (each node can have three children), find all the root-to-leaf paths
class Node
  attr_accessor :val, :left, :right
  def initialize(val = 0, _children=nil)
      @val = val
      @children = _children
  end
end

def ternary_tree_paths(root)
  result = []
  dfs_ternary_paths(root, [], result)
  return result
end

def dfs_ternary_tree_paths(root, path, res)
  # exit condition: when a lead node is reached, append the path to the results
  if root.children.nil?
    res << path.join("->") + "->" + root.val.to_s
    return
  end

  # DFS on each non-null child
  root.children.each do |child|
    if !child.nil?
      path << root.val.to_s
      dfs_ternary_tree_paths(child, path, res)
      path.pop
    end
  end
end