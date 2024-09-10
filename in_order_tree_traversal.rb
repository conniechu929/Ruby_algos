class Node
  attr_accessor :val, :left, :right
  def initialize(val = 0, _left = nil, _right = nil)
    @val = val
    @left = _left
    @right = _right
  end
  
  # In-order traversal visits the left branch first, then the current node
  # and finally the right branch.
  # use recursion to do an in-order traversal
  def in_order_traversal(root)
    if !root.nil?
      in_order_traversal(root.left)
      in_order_traversal(root.right)
    end
  end

  # Pre-order traversal visits current node first, then the left subtree.
  # and finally the right subtree
  def pre_order_traversal(root)
    if !root.nil?
      pre_order_traversal(root.left)
      pre_order_traversal(root.right)
    end
  end

  # Post-order traversal visits the left subtree first, then the right subtree,
  # and finally the current node.
  def post_order_traversal(root)
    if !root.nil?
      post_order_traversal(root.left)
      post_order_traversal(root.right)
    end
  end
end