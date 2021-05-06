/*
 * @lc app=leetcode.cn id=516 lang=swift
 *
 * [516] 最长回文子序列
 *
 * https://leetcode-cn.com/problems/longest-palindromic-subsequence/description/
 *
 * algorithms
 * Medium (60.73%)
 * Likes:    439
 * Dislikes: 0
 * Total Accepted:    47.9K
 * Total Submissions: 78.2K
 * Testcase Example:  '"bbbab"'
 *
 * 给定一个字符串 s ，找到其中最长的回文子序列，并返回该序列的长度。可以假设 s 的最大长度为 1000 。
 * 
 * 
 * 
 * 示例 1:
 * 输入:
 * 
 * "bbbab"
 * 
 * 
 * 输出:
 * 
 * 4
 * 
 * 
 * 一个可能的最长回文子序列为 "bbbb"。
 * 
 * 示例 2:
 * 输入:
 * 
 * "cbbd"
 * 
 * 
 * 输出:
 * 
 * 2
 * 
 * 
 * 一个可能的最长回文子序列为 "bb"。
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 <= s.length <= 1000
 * s 只包含小写英文字母
 * 
 * 
 */

// @lc code=start
class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
            guard s.count > 0 else { return 0 }
    guard s.count > 1 else { return 1 }
    
    var sArray: [Character] = []
    for char in s {
        sArray.append(char)
    }
    
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: s.count + 1), count: s.count + 1)
    for i in 1 ... s.count {
        dp[i][i] = 1
    }
    
    var _max = 0;
    for i in 1 ... s.count {
        for j in stride(from: i - 1, to: 0, by: -1) {
            if sArray[i - 1] == sArray[j - 1] {
                dp[i][j] = dp[i - 1][j + 1] + 2
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i][j + 1])
            }
            _max = max(_max, dp[i][j])
        }
    }
    return _max

    }
}
// @lc code=end

