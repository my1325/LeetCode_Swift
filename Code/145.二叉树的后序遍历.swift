/*
 * @lc app=leetcode.cn id=145 lang=swift
 *
 * [145] 二叉树的后序遍历
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
    
    /// 循环
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let rootNode = root else { return [] }
        var retValue: [Int] = []
        var nodeStack: [TreeNode] = [rootNode]
        
        while !nodeStack.isEmpty {
            let node = nodeStack.removeLast()
            retValue.append(node.val)
            if let left = node.left { nodeStack.append(left) }
            if let right = node.right { nodeStack.append(right) }
        }
        return retValue.reversed()
    }

    /// 递归
    func postorderTraversal1(_ root: TreeNode?) -> [Int] {
        guard let rootNode = root else { return [] }
        var retValue: [Int] = []
        
        if let left = rootNode.left { retValue += postorderTraversal(left) }
        if let right = rootNode.right { retValue += postorderTraversal(right) }
        retValue.append(rootNode.val)
        return retValue
    }
}
// @lc code=end

