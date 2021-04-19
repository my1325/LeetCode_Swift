/*
 * @lc app=leetcode.cn id=70 lang=swift
 *
 * [70] 爬楼梯
 *
 * https://leetcode-cn.com/problems/climbing-stairs/description/
 *
 * algorithms
 * Easy (51.69%)
 * Likes:    1611
 * Dislikes: 0
 * Total Accepted:    422.2K
 * Total Submissions: 814.9K
 * Testcase Example:  '2'
 *
 * 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 * 
 * 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 * 
 * 注意：给定 n 是一个正整数。
 * 
 * 示例 1：
 * 
 * 输入： 2
 * 输出： 2
 * 解释： 有两种方法可以爬到楼顶。
 * 1.  1 阶 + 1 阶
 * 2.  2 阶
 * 
 * 示例 2：
 * 
 * 输入： 3
 * 输出： 3
 * 解释： 有三种方法可以爬到楼顶。
 * 1.  1 阶 + 1 阶 + 1 阶
 * 2.  1 阶 + 2 阶
 * 3.  2 阶 + 1 阶
 * 
 * 
 */

// @lc code=start
class Solution {
    func climbStairs(_ n: Int) -> Int {
        var dp: [Int] = Array(repeating: 0, count: n + 5)
        dp[0] = 0
        dp[1] = 1
        dp[2] = 2
        for _n in 3 ..< dp.count {
            dp[_n] = dp[_n - 1] + dp[_n - 2]
        }
        return dp[n]
    }

    func _climbStairs(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if n == 1 { return 1 }        
        if n == 2 { return 2 }

        return climbStairs(n - 1) + climbStairs(n - 2)
    }
}
// @lc code=end

