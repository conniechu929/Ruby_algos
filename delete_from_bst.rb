# After you find the node, if the node's right subtree is empty, 
# bring its left subtree to its current position and remove the node. 
# Otherwise, delete the leftmost node of the right subtree and put it in its current position.
def find(tree, val)
 if tree.nil?
  return false
 end

 if tree.val == val
  return true
 elsif tree.val < val
  return find(tree.left, val)
 else
  return find(tree.right, val)
 end
end

def insert(tree, val)
  if tree.nil?
    return Node.new(val)
  end
  if tree.val < val
    tree.right = insert(tree.right, val)
  elsif tree.val > val
    tree.left = insert(tree.left, val)
  end

  return tree
end