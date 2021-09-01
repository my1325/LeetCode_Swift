/*
 * @lc app=leetcode.cn id=128 lang=swift
 *
 * [128] 最长连续序列
 *
 * https://leetcode-cn.com/problems/longest-consecutive-sequence/description/
 *
 * algorithms
 * Hard (53.13%)
 * Likes:    751
 * Dislikes: 0
 * Total Accepted:    113.1K
 * Total Submissions: 211.9K
 * Testcase Example:  '[100,4,200,1,3,2]'
 *
 * 给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。
 * 
 * 
 * 
 * 进阶：你可以设计并实现时间复杂度为 O(n) 的解决方案吗？
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：nums = [100,4,200,1,3,2]
 * 输出：4
 * 解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。
 * 
 * 示例 2：
 * 
 * 
 * 输入：nums = [0,3,7,2,5,8,4,6,0,1]
 * 输出：9
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 0 
 * -10^9 
 * 
 * 
 */

// @lc code=start
class Solution {
        
    func longestConsecutive(_ nums: [Int]) -> Int {
        var c: [Int: Int] = [:]
        var res: Int = 0
        for i in nums {
            guard c[i] == nil else { continue }
            let left = c[i - 1] ?? 0
            let right = c[i + 1] ?? 0
            c[i] = left + right + 1

            c[i - left] = c[i]
            c[i + right] = c[i]
            res = max(res, c[i]!)
        }
        return res
    }
}
// @lc code=end

