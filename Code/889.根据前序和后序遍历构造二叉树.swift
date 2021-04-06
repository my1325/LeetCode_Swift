/*
 * @lc app=leetcode.cn id=889 lang=swift
 *
 * [889] 根据前序和后序遍历构造二叉树
 *
 * https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal/description/
 *
 * algorithms
 * Medium (67.80%)
 * Likes:    153
 * Dislikes: 0
 * Total Accepted:    11.1K
 * Total Submissions: 16.4K
 * Testcase Example:  '[1,2,4,5,3,6,7]\n[4,5,2,6,7,3,1]'
 *
 * 返回与给定的前序和后序遍历匹配的任何二叉树。
 *
 * pre 和 post 遍历中的值是不同的正整数。
 *
 *
 *
 * 示例：
 *
 * 输入：pre = [1,2,4,5,3,6,7], post = [4,5,2,6,7,3,1]
 * 输出：[1,2,3,4,5,6,7]
 *
 *
 *
 *
 * 提示：
 *
 *
 * 1 <= pre.length == post.length <= 30
 * pre[] 和 post[] 都是 1, 2, ..., pre.length 的排列
 * 每个输入保证至少有一个答案。如果有多个答案，可以返回其中一个。
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
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func constructFromPrePost(_ pre: [Int], _ post: [Int]) -> TreeNode? {
        for index in 0 ..< post.count {
            cacheIndex[post[index]] = index
        }
        var index = 0
        return _buildTree(&index, 0, post.count, pre, post)
    }

    var cacheIndex: [Int: Int] = [:]
    func _buildTree(_ index: inout Int, _ min: Int, _ max: Int, _ pre: [Int], _ post: [Int]) -> TreeNode? {
        guard index < post.count, min >= 0, max <= post.count, min <= max, let postIndex = cacheIndex[pre[index]], (min ..< max).contains(postIndex) else {
            return nil
        }

        let preValue = pre[index]

        let root = TreeNode(preValue)

        index += 1

        if index >= pre.count || postIndex == 0 {
            return root
        }
        let _min = cacheIndex[pre[index]]!
        if pre[index] == post[postIndex - 1] {
            /// 全是右子节点
            root.right = _buildTree(&index, min, postIndex, pre, post)
        } else {
            /// 左边的子节点
            root.left = _buildTree(&index, min, postIndex, pre, post)
            /// 右边的子节点
            root.right = _buildTree(&index, _min, postIndex, pre, post)
        }

        return root
    }
}

// @lc code=end
