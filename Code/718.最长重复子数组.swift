/*
 * @lc app=leetcode.cn id=718 lang=swift
 *
 * [718] 最长重复子数组
 *
 * https://leetcode-cn.com/problems/maximum-length-of-repeated-subarray/description/
 *
 * algorithms
 * Medium (55.39%)
 * Likes:    441
 * Dislikes: 0
 * Total Accepted:    61.1K
 * Total Submissions: 109.4K
 * Testcase Example:  '[1,2,3,2,1]\n[3,2,1,4,7]'
 *
 * 给两个整数数组 A 和 B ，返回两个数组中公共的、长度最长的子数组的长度。
 * 
 * 
 * 
 * 示例：
 * 
 * 输入：
 * A: [1,2,3,2,1]
 * B: [3,2,1,4,7]
 * 输出：3
 * 解释：
 * 长度最长的公共子数组是 [3, 2, 1] 。
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= len(A), len(B) <= 1000
 * 0 <= A[i], B[i] < 100
 * 
 * 
 */

// @lc code=start
class Solution {
    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: nums2.count + 1), count: nums1.count + 1)

        var maxLength = 0
        for i in 1 ... nums1.count {
            for j in 1 ... nums2.count {
                if nums1[i - 1] == nums2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                }
                maxLength = max(maxLength, dp[i][j])
            }
        }
        return maxLength
    }
}
// @lc code=end

