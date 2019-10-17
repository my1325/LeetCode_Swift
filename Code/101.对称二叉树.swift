/*
 * @lc app=leetcode.cn id=101 lang=swift
 *
 * [101] 对称二叉树
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
    func isSymmetric(_ root: TreeNode?) -> Bool {
//          1
//    2          2
//4      3   3     4
//5 6  7 8 87  6 5
        let deep = deepFor(root: root, current: 1)
        let count = 2 << (deep - 1) - 1
    }
    
    
    
    func deepFor(root: TreeNode?, current: Int) -> Int {
        guard let node = root else {
            return 0
        }
        return max(deepFor(root: node.left, current: current), deepFor(root: node.right, current: current)) + current
    }
}

