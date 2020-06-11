# Given a binary tree, write a function to get the maximum width of the given tree. 
# The width of a tree is the maximum width among all levels. 
# The binary tree has the same structure as a full binary tree, but some nodes are null.

# The width of one level is defined as the length between the end-nodes 
# (the leftmost and right most non-null nodes in the level, where the null nodes between the end-nodes are also counted into the length calculation.

# Example 1:

# Input: 

#            1
#          /   \
#         3     2
#        / \     \  
#       5   3     9 

# Output: 4
# Explanation: The maximum width existing in the third level with the length 4 (5,3,null,9).

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}

def width_of_binary_tree(root)
    return 0 if root.nil?

    queue = [root]
    index = [0]
    result = 0
    
    while !queue.empty?
        len = queue.length
        result = [result, index[len - 1] - index[0] + 1].max

        len.times do |i|
            current = queue.shift
            current_pos = index.shift

            if current.left
                queue << current.left
                index << current_pos * 2 + 1
            end

            if current.right
                queue << current.right
                index << current_pos * 2 + 2
            end
        end
    end
    result
end


# def width_of_binary_tree(root)
#     if !root
#         return 0
#     end
    
#     queue = [{node: root, pos: 1}]
#     max = 0
    
#     while !queue.empty?
#         l = queue.length
#         min_pos = 0
#         max_pos = 0
        
#         for i in (0..l-1)
#             current = queue.shift()
#             current_node, current_pos = current[:node], current[:pos] 
            
#             if i == 0
#                 min_pos = current_pos
#             end
#             if i == l - 1
#                 max_pos = current_pos
#             end
#             if current_node.left != nil
#                 queue << {node: current_node.left, pos: 2*current_pos}
#             end
#             if current_node.right != nil
#                 queue << {node: current_node.right, pos: 2*current_pos + 1}
#             end
#         end
#         max = [max, max_pos - min_pos + 1].max()
#     end
#     return max
# end