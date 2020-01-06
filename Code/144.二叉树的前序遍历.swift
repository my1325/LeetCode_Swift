/*
 * @lc app=leetcode.cn id=144 lang=swift
 *
 * [144] 二叉树的前序遍历
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
    
    /// 循环法
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let rootNode = root else { return [] }
        var nodeStack: [TreeNode] = [rootNode]
        var retValue: [Int] = []
        
        while !nodeStack.isEmpty {
            let node = nodeStack.removeLast()
            retValue.append(node.val)
            
            if let right = node.right { nodeStack.append(right) }
            if let left = node.left { nodeStack.append(left) }
        }

        return retValue
    }
    
    /// 递归法
    func preorderTraversal1(_ root: TreeNode?) -> [Int] {
        guard let node = root else { return [] }
        var retValue: [Int] = [node.val]
        if let left = node.left {  retValue += preorderTraversal(left) }
        if let right = node.right { retValue += preorderTraversal(right) }
        return retValue
    }
}
// @lc code=end

