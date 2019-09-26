/*
 * @lc app=leetcode.cn id=98 lang=swift
 *
 * [98] 验证二叉搜索树
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
    /// 中序遍历
    var lastVal: Int?
    func isValidBST1(_ root: TreeNode?) -> Bool {
        guard let node = root else { return true }
        
        if !isValidBST(node.left) { return false }
        if let lVal = lastVal, lVal >= node.val { return false }
        lastVal = node.val
        if !isValidBST(node.right) { return false }
        return true
    }
    
    /// 界定值大小
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST(root, max: nil, min: nil)
    }
    
    private func isValidBST(_ node: TreeNode?, max: Int?, min: Int?) -> Bool {
        guard let node = node else { return true }
        
        if !isValidBST(node.left, max: node.val, min: min) { return false }
        if !isValidBST(node.right, max: max, min: node.val) { return false }
        
        if let max = max, node.val >= max { return false }
        if let min = min, node.val <= min { return false }
        return true
    }
}

