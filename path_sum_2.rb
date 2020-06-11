# Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.

# Note: A leaf is a node with no children.

# Example:

# Given the below binary tree and sum = 22,

#       5
#      / \
#     4   8
#    /   / \
#   11  13  4
#  /  \    / \
# 7    2  5   1
# Return:

# [
#    [5,4,11,2],
#    [5,8,4,5]
# ]

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
# @param {Integer} sum
# @return {Integer[][]}
def path_sum(root, sum)
    result = []
    dfs(root, sum, 0, [], result)
    return result
end

def dfs(node, target, s, path, result)
    if !node
        return nil
    end
    s += node.val
    if node.left == nil and node.right == nil and s == target
        result << path+[node.val]
    end
    dfs(node.left, target, s, path+[node.val], result)
    dfs(node.right, target, s, path+[node.val], result)
end