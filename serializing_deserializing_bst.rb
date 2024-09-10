# Given a binary tree, write a serialize function that converts the tree into a string
# and a deserialize function that converts a string back to a binary tree

@res = []
def serialize(root)
  
  serialize_dfs(root)
  return @res.join(" ")
end

def serialize_dfs(root)
  if root.nil?
    @res << 'x'
    return
  end
  
  @res << root.val.to_s
  serialize_dfs(root.left)
  serialize_dfs(root.right)
end

def deserialize(s)
  list = s.split("")
  return deserialize_dfs(list)
end

def deserialize_dfs(nodes)
  nodes.each do |val|
    if val == "x"
      return nil
    end
    curr = Node.new(val.to_i)
    curr.left = deserialize_dfs(nodes)
    curr.right = deserialize_dfs(nodes)
  end
  
  return curr
end