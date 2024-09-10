# template for BFS
def bfs_by_queue(root)
  queue = Queue.new(root)        # at least one element in the queue to kick start bfs
  while queue.length > 0         # as long as there is an element in the queue
    node = queue.unshift         # dequeue
    for child in node.children   # enqueue children
      if OK(child)               # early return if problem condition met
        return FOUND(child)
      end
      queue.shift(child)
    end
  end
end

class Node
  attr_accessor :val, :left, :right
  def initialize(val = 0, _left = nil, _right = nil)
    @val = val
    @left = _left
    @right = _right
  end
end

# BFS Tree level order traversal
def level_order_traversal(root)
  result = []
  queue = [root]              # at least one element in the queue to kick start bfs
  while queue.length > 0      # as long as there is element in the queue
    n = queue.length          # number of nodes in current level
    new_level = []
    i = 0
    while i < n               # dequeue each node in the current level
      node = queue.shift
      new_level << node.val
      if node.left != nil
        queue << node.left
      end
      if node.right != nil
        queue << node.right 
      end
      i += 1
    end
    result << new_level
  end
  return result
end

# Binary tree zigzag level order traversal
def zigzag_level_order_traversal(root)
  result = []
  queue = [root]
  left_to_right_flag = true
  while queue.length > 0
    n = queue.length
    new_level = []
    i = 0
    while i < n
      node = queue.shift
      if left_to_right_flag
        new_level << node.val
      else
        new_level.unshift(node.val)    # add to the left of the array
      end
      if node.left != nil
        queue << node.left
      end
      if node.right != nil
        queue << node.right 
      end
      i += 1
    end
    result << new_level
    left_to_right_flag = !left_to_right_flag
  end
  return result
end

# binary tree right side view
def binary_tree_right_side_view(root)
  result = []
  queue = [root]
  while queue.length > 0
    level_size = queue.length
    i = 0
    while i < level_size
      node = queue.shift
      if i == level_size - 1
        result << node.val
      end
      if node.left != nil
        queue << node.left
      end
      if node.right != nil
        queue << node.right 
      end
      i += 1
    end
  end
  return result
end

# Binary tree min depth
def binary_tree_min_depth(root)
  if root.nil?
    return 0
  end
  queue = [root]              # at least one element in the queue to kick start bfs
  depth = -1                  # we start from -1 because popping root will add 1 depth
  while queue.length > 0      # as long as there is element in the queue
    depth += 1
    n = queue.length
    i = 0
    while i < n
      node = queue.shift
      if node.left == nil && node.right == nil
        return depth
      end
      if node.left != nil
        queue << node.left
      end
      if node.right != nil
        queue << node.right 
      end
      i += 1
    end
  end
  return depth
end
