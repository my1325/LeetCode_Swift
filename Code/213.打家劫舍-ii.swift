/*
 * @lc app=leetcode.cn id=213 lang=swift
 *
 * [213] 打家劫舍 II
 *
 * https://leetcode-cn.com/problems/house-robber-ii/description/
 *
 * algorithms
 * Medium (41.22%)
 * Likes:    670
 * Dislikes: 0
 * Total Accepted:    121.1K
 * Total Submissions: 284.6K
 * Testcase Example:  '[2,3,2]'
 *
 * 你是一个专业的小偷，计划偷窃沿街的房屋，每间房内都藏有一定的现金。这个地方所有的房屋都 围成一圈
 * ，这意味着第一个房屋和最后一个房屋是紧挨着的。同时，相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警 。
 * 
 * 给定一个代表每个房屋存放金额的非负整数数组，计算你 在不触动警报装置的情况下 ，今晚能够偷窃到的最高金额。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：nums = [2,3,2]
 * 输出：3
 * 解释：你不能先偷窃 1 号房屋（金额 = 2），然后偷窃 3 号房屋（金额 = 2）, 因为他们是相邻的。
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：nums = [1,2,3,1]
 * 输出：4
 * 解释：你可以先偷窃 1 号房屋（金额 = 1），然后偷窃 3 号房屋（金额 = 3）。
 * 偷窃到的最高金额 = 1 + 3 = 4 。
 * 
 * 示例 3：
 * 
 * 
 * 输入：nums = [0]
 * 输出：0
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 
 * 0 
 * 
 * 
 */

// @lc code=start
class Solution {
func rob(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    guard nums.count > 1 else { return nums[0] }
    
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: nums.count)
    dp[0][0] = nums[0]
    dp[1][0] = nums[0]
    dp[1][1] = nums[1]
    
    for i in 2 ..< nums.count {
        if i == nums.count - 1 {
            dp[i][0] = dp[i - 1][0]
        } else {
            dp[i][0] = max(dp[i - 1][0], dp[i - 2][0] + nums[i])
        }
        
        dp[i][1] = max(dp[i - 1][1], dp[i - 2][1] + nums[i])
    }
    return max(dp[nums.count - 1][0], dp[nums.count - 1][1])
}
}
// @lc code=end

