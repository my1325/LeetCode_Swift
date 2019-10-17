/*
 * @lc app=leetcode.cn id=114 lang=swift
 *
 * [114] 二叉树展开为链表
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
    
    var lastNode: TreeNode?
    func flatten(_ root: TreeNode?) {
        guard let node = root else {
            return
        }
        flatten(node.right)
        flatten(node.left)
        node.right = lastNode
        node.left = nil
        lastNode = node
    }
    
    func flatten2(_ root: TreeNode?) {
        var node1 = root
        while let node = node1 {
            if let left = node.left {
                let oldRight = node.right
                node.right = left
                node.left = nil
                
                var topRight: TreeNode? = node
                while let right = topRight?.right {
                    topRight = right
                }
                topRight?.right = oldRight
            }
            node1 = node.right
        }
    }
    
    func flatten1(_ root: TreeNode?) {
        guard let node = root else {
            return
        }
        
        if let left = node.left {
            let oldRight = node.right
            node.right = left
            node.left = nil
            
            var newRight: TreeNode? = node
            while let right = newRight?.right {
                newRight = right
            }
            newRight?.right = oldRight
        }
        flatten(node.right)
    }
}
// @lc code=end

