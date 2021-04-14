/*
 * @lc app=leetcode.cn id=652 lang=swift
 *
 * [652] 寻找重复的子树
 *
 * https://leetcode-cn.com/problems/find-duplicate-subtrees/description/
 *
 * algorithms
 * Medium (56.31%)
 * Likes:    256
 * Dislikes: 0
 * Total Accepted:    22.4K
 * Total Submissions: 39.7K
 * Testcase Example:  '[1,2,3,4,null,2,4,null,null,4]'
 *
 * 给定一棵二叉树，返回所有重复的子树。对于同一类的重复子树，你只需要返回其中任意一棵的根结点即可。
 * 
 * 两棵树重复是指它们具有相同的结构以及相同的结点值。
 * 
 * 示例 1：
 * 
 * ⁠       1
 * ⁠      / \
 * ⁠     2   3
 * ⁠    /   / \
 * ⁠   4   2   4
 * ⁠      /
 * ⁠     4
 * 
 * 
 * 下面是两个重复的子树：
 * 
 * ⁠     2
 * ⁠    /
 * ⁠   4
 * 
 * 
 * 和
 * 
 * ⁠   4
 * 
 * 
 * 因此，你需要以列表的形式返回上述重复子树的根结点。
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

    var cacheSubTree: [String: Int] = [:]
    var subtrees: [TreeNode?] = []
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        _ = traverse(root)
        return subtrees
    }

    func traverse(_ root: TreeNode?) -> String {
        guard let _root = root else { return "null" }

        let left = traverse(_root.left)
        let right = traverse(_root.right)

        let subtree = left + "-" + right + "-" + "\(_root.val)"

        let cachedNumber = cacheSubTree[subtree] ?? 0
        if cachedNumber == 1 {
            subtrees.append(_root)
        }  
           
        cacheSubTree[subtree] = cachedNumber + 1
        
        return subtree
    }
}
// @lc code=end

