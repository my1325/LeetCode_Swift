/*
 * @lc app=leetcode.cn id=231 lang=swift
 *
 * [231] 2的幂
 */

// @lc code=start
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n == 0 { return false }
        return n & (n - 1) == 0
    }
}
// @lc code=end

