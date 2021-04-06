/*
 * @lc app=leetcode.cn id=106 lang=swift
 *
 * [106] 从中序与后序遍历序列构造二叉树
 *
 * https://leetcode-cn.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/description/
 *
 * algorithms
 * Medium (71.53%)
 * Likes:    476
 * Dislikes: 0
 * Total Accepted:    98.9K
 * Total Submissions: 138.3K
 * Testcase Example:  '[9,3,15,20,7]\n[9,15,7,20,3]'
 *
 * 根据一棵树的中序遍历与后序遍历构造二叉树。
 * 
 * 注意:
 * 你可以假设树中没有重复的元素。
 * 
 * 例如，给出
 * 
 * 中序遍历 inorder = [9,3,15,20,7]
 * 后序遍历 postorder = [9,15,7,20,3]
 * 
 * 返回如下的二叉树：
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
 * 
 * 
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        for index in 0 ..< inorder.count {
            cacheIndex[inorder[index]] = index
        }
        var index = postorder.count - 1
        return _buildTree(&index, 0, inorder.count, inorder, postorder)
    }

    var cacheIndex: [Int: Int] = [:]
    // var preorderOffset: Int = 0
    func _buildTree(_ index: inout Int, _ min: Int, _ max: Int, _ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard index >= 0, let current = cacheIndex[postorder[index]], (min ..< max).contains(current) else { return nil }
        let root = TreeNode(postorder[index])

        index -= 1
        root.right = _buildTree(&index, current, max, inorder, postorder)
        root.left = _buildTree(&index, min, current, inorder, postorder)
        return root
    }
}
// @lc code=end

