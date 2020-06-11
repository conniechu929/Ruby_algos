class Node
    attr_reader :value, :left, :right 
    def initialize(value, left=nil, right=nil)
        @value = value
        @left = left
        @right = right
    end
end

def is_bst(node, lower_lim=null, upper_lim=null)
    if lower_lim != null and node.value < lower_limit
        return false
    end
    if upper_lim != null and node.value > upper_limit
        return false
    end

    is_left_bst = true
    is_right_bst = true

    if node.left != null
        is_left_bst = is_bst(node.left, lower_lim, node.value)
    end
    if is_left_bst and node.right != null
        is_right_bst = is_bst(node.right, node.value, upper_lim)
    end 
    return is_left_bst and is_right_bst
end