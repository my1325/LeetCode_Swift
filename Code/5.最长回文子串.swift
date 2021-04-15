/*
 * @lc app=leetcode.cn id=5 lang=swift
 *
 * [5] 最长回文子串
 */

// @lc code=start
class Solution {
    func longestPalindrome(_ s: String) -> String {
        var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        var end: Int = 0
        var begin: Int = 0
        var maxLength: Int = 0

        var _cacheChar: [Character] = []
        for char in s {
            _cacheChar.append(char)
        }

        for index in 1 ..< _cacheChar.count {
            for _index in 0 ..< index {
                if _cacheChar[index] == _cacheChar[_index], dp[_index + 1][index - 1] || index - _index <= 2 {
                    dp[_index][index] = true
                    let length = index - _index + 1
                    if length > maxLength {
                        maxLength = length
                        begin = _index
                        end = index
                    }
                }
            }
        }

        return String(_cacheChar[begin ... end])
    }
}

// @lc code=end
