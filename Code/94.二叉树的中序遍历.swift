/*
 * @lc app=leetcode.cn id=94 lang=swift
 *
 * [94] 二叉树的中序遍历
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let rootNode = root else { return [] }
        var retValue: [Int] = []
        var nodeStack: [TreeNode] = [rootNode]
        var currentNode: TreeNode? = rootNode
        
        while currentNode != nil || !nodeStack.isEmpty {
            var leftNode: TreeNode? = currentNode
            while let left = leftNode?.left {
                leftNode = left
                nodeStack.append(left)
            }
            let node = nodeStack.removeLast()
            retValue.append(node.val)
            currentNode = node.right
            if let right = node.right {
                nodeStack.append(right)
            }
        }

        return retValue
    }
    
    /// 递归
    func inorderTraversal1(_ root: TreeNode?) -> [Int] {
        guard let rootNode = root else { return [] }
        var retValue: [Int] = []
        if let left = rootNode.left { retValue += inorderTraversal(left) }
        retValue += [rootNode.val]
        if let right = rootNode.right { retValue += inorderTraversal(right) }
        return retValue
    }
}
// @lc code=end

