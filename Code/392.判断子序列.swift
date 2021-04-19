/*
 * @lc app=leetcode.cn id=392 lang=swift
 *
 * [392] 判断子序列
 *
 * https://leetcode-cn.com/problems/is-subsequence/description/
 *
 * algorithms
 * Easy (50.89%)
 * Likes:    429
 * Dislikes: 0
 * Total Accepted:    117.1K
 * Total Submissions: 230K
 * Testcase Example:  '"abc"\n"ahbgdc"'
 *
 * 给定字符串 s 和 t ，判断 s 是否为 t 的子序列。
 *
 *
 * 字符串的一个子序列是原始字符串删除一些（也可以不删除）字符而不改变剩余字符相对位置形成的新字符串。（例如，"ace"是"abcde"的一个子序列，而"aec"不是）。
 *
 * 进阶：
 *
 * 如果有大量输入的 S，称作 S1, S2, ... , Sk 其中 k >= 10亿，你需要依次检查它们是否为 T
 * 的子序列。在这种情况下，你会怎样改变代码？
 *
 * 致谢：
 *
 * 特别感谢 @pbrother 添加此问题并且创建所有测试用例。
 *
 *
 *
 * 示例 1：
 *
 *
 * 输入：s = "abc", t = "ahbgdc"
 * 输出：true
 *
 *
 * 示例 2：
 *
 *
 * 输入：s = "axc", t = "ahbgdc"
 * 输出：false
 *
 *
 *
 *
 * 提示：
 *
 *
 * 0
 * 0
 * 两个字符串都只由小写字符组成。
 *
 *
 */

// @lc code=start
class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var sl: [Character] = []
        for char in s {
            sl.append(char)
        }

        var tl: [Character] = []
        for char in t {
            tl.append(char)
        }

        var dp: [Bool] = Array(repeating: false, count: sl.count)
        /// dp[i] = dp[i - 1] && tl[i] in sl
        var sindex = 0, tindex = 0
        while tindex < tl.count, sindex < sl.count {
            if sl[sindex] == tl[tindex], sindex == 0 || dp[sindex - 1] {
                dp[sindex] = true
                sindex += 1
            }
            tindex += 1
        }

        return dp.last ?? true
    }
}

// @lc code=end
