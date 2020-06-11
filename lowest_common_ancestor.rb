class Node
    attr_reader :value, :left, :right 
    def initialize(value, left=nil, right=nil)
        @value = value
        @left = left
        @right = right
    end
end

def lca(root, j, k)
    path_to_j = path_to_x(root, j)
    path_to_k = path_to_x(root, k)

    if path_to_j == null or path_to_k == null
        return null
    end

    lca_to_return = null
    # because path_to_j or path_to_k are stored as stacks
    # we will use a while loop
    # last one in, first one out
    while !path_to_j.empty? and !path_to_k.empty?
        j_pop = path_to_j.pop()
        k_pop = path_to_k.pop()

        if j_pop == k_pop
            lca_to_return = j_pop
        else
            break
        end
    end
    return lca_to_return
end

def path_to_x(root, x)
    return null if root == null
    return [root] if root.value == x

    left_path = path_to_x(root.left, x)
    if left_path != null
        left_path.push(root)
        return left_path
    end

    right_path = path_to_x(root.right, x)
    if right_path != null
        right_path.push(root)
        return right_path
    end

    return null
end