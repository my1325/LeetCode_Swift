/*
 * @lc app=leetcode.cn id=124 lang=swift
 *
 * [124] 二叉树中的最大路径和
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    
    var sum: Int = Int.min
    func maxPathSum(_ root: TreeNode?) -> Int {
        maxSubNode(root: root)
        return sum
    }
    
    @discardableResult
    private func maxSubNode(root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        
        let leftValue = max(0, maxSubNode(root: node.left))
        let rightValue = max(0, maxSubNode(root: node.right))
    
        sum = max(sum, node.val + leftValue + rightValue)
        
        return node.val + max(leftValue, rightValue)
    }
}

