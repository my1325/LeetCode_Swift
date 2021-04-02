/*
 * @lc app=leetcode.cn id=105 lang=swift
 *
 * [105] 从前序与中序遍历序列构造二叉树
 *
 * https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/
 *
 * algorithms
 * Medium (69.50%)
 * Likes:    967
 * Dislikes: 0
 * Total Accepted:    173.6K
 * Total Submissions: 249.7K
 * Testcase Example:  '[3,9,20,15,7]\n[9,3,15,20,7]'
 *
 * 根据一棵树的前序遍历与中序遍历构造二叉树。
 * 
 * 注意:
 * 你可以假设树中没有重复的元素。
 * 
 * 例如，给出
 * 
 * 前序遍历 preorder = [3,9,20,15,7]
 * 中序遍历 inorder = [9,3,15,20,7]
 * 
 * 返回如下的二叉树：
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
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

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    guard preorder.count > 0 else { return nil }
    if let rootValue = preorder.first {
        return _buildTree(rootValue, 0, inorder.count, preorder, inorder)
    } else {
        return nil
    }
}

var preorderOffset: Int = 0
func _buildTree(_ value: Int, _ min: Int, _ max: Int, _ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    guard let current = inorder.firstIndex(of: value) else { return nil }
    let root = TreeNode(value)
    
    preorderOffset += 1
    if preorderOffset < preorder.count {
        let leftValue = preorder[preorderOffset]
        if let index = _findValue(leftValue, min, current, inorder) {
            root.left = _buildTree(leftValue, min, current, preorder, inorder)
        }
        
        if preorderOffset < preorder.count {
            let rightVal = preorder[preorderOffset]
            if let index = _findValue(rightVal, current, max, inorder) {
                root.right = _buildTree(rightVal, current, max, preorder, inorder)
            }
        }
    }
    
    return root
}

func _findValue(_ value: Int, _ left: Int, _ right: Int, _ order: [Int]) -> Int? {
    guard right - left > 0 else { return nil }
    for index in left ..< right {
        if value == order[index] {
            return index
        }
    }
    return nil
}
}
// @lc code=end

