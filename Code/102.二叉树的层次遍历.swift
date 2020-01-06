/*
 * @lc app=leetcode.cn id=102 lang=swift
 *
 * [102] 二叉树的层次遍历
 */

// @lc code=start
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else { return [] }
        var pushStack: [TreeNode] = [node]
        var popStack: [TreeNode] = []
        var retValue: [[Int]] = []
        while !pushStack.isEmpty {
            var value: [Int] = []
            while !pushStack.isEmpty {
                let popNode = pushStack.removeLast()
                value.append(popNode.val)
                popStack.append(popNode)
            }
            retValue.append(value)
            while !popStack.isEmpty {
                let popedNode = popStack.removeLast()
                if let right = popedNode.right {
                    pushStack.append(right)
                }
                if let left = popedNode.left {
                    pushStack.append(left)
                }
            }
        }
        return retValue
    }
}
// @lc code=end

