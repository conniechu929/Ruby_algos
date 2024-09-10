# given a binary search tree, find the lowest common ancestor node of two give nodes in BST
def lca_on_bst(bst, p, q)
  # if p and q are on the left side of the current node, then we search the left side
  if p < bst.val && q < bst.val
    return lca_on_bst(bst.left, p, q)
  # if p and q are on the right side of the current node, then we search the right side
  elsif p > bst.val && q > bst.val
    return lca_on_bst(bst.right, p, q)
  # if p and q are split (one is on the left, the other is on the right) then we can return the current node
  # as the lowest common ancestor
  else
    return bst.val
  end 
end