/*
 * @lc app=leetcode.cn id=64 lang=swift
 *
 * [64] 最小路径和
 *
 * https://leetcode-cn.com/problems/minimum-path-sum/description/
 *
 * algorithms
 * Medium (68.26%)
 * Likes:    865
 * Dislikes: 0
 * Total Accepted:    210K
 * Total Submissions: 307.1K
 * Testcase Example:  '[[1,3,1],[1,5,1],[4,2,1]]'
 *
 * 给定一个包含非负整数的 m x n 网格 grid ，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
 *
 * 说明：每次只能向下或者向右移动一步。
 *
 *
 *
 * 示例 1：
 *
 *
 * 输入：grid = [[1,3,1],[1,5,1],[4,2,1]]
 * 输出：7
 * 解释：因为路径 1→3→1→1→1 的总和最小。
 *
 *
 * 示例 2：
 *
 *
 * 输入：grid = [[1,2,3],[4,5,6]]
 * 输出：12
 *
 *
 *
 *
 * 提示：
 *
 *
 * m == grid.length
 * n == grid[i].length
 * 1
 * 0
 *
 *
 */

// @lc code=start
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var dp: [[Int]] = Array(repeating: Array(repeating: Int.max, count: grid[0].count + 1), count: grid.count + 1)
        dp[0][1] = 0
        dp[1][0] = 0
        for i in 1 ... grid.count {
            for j in 1 ... grid[0].count {
                dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + grid[i - 1][j - 1]
            }
        }
        return dp[grid.count][grid[0].count]
    }
}

// @lc code=end
