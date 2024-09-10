class Node
  attr_accessor :val, :left, :right
  def initialize(val = 0, _left = nil, _right = nil)
      @val = val
      @left = _left
      @right = _right
  end
end

# Insert into BST
# Given the root node of a valid BST and a value to insert into the tree, 
# return a new root node representing the valid BST with the addition of the new item.
# If the new item already exists in the binary search tree, do not insert anything.
def insert_bst(bst, val)
  if bst.nil?
    return Node.new(val)
  end

  if bst.val < val
    bst.right = insert_bst(bst.right, val)
  elsif bst.val > val
    bst.left = insert_bst(bst.left, val)
  end

  return bst
end