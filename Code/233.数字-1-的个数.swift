/*
 * @lc app=leetcode.cn id=233 lang=swift
 *
 * [233] 数字 1 的个数
 *
 * https://leetcode-cn.com/problems/number-of-digit-one/description/
 *
 * algorithms
 * Hard (45.03%)
 * Likes:    284
 * Dislikes: 0
 * Total Accepted:    24.9K
 * Total Submissions: 55.4K
 * Testcase Example:  '13'
 *
 * 给定一个整数 n，计算所有小于等于 n 的非负整数中数字 1 出现的个数。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：n = 13
 * 输出：6
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：n = 0
 * 输出：0
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 0 
 * 
 * 
 */

// @lc code=start
class Solution {
    func countDigitOne(_ n: Int) -> Int {
        var s: [Int] = []
        var _n = n 
        while _n > 0 {
            s.append(_n % 10)
            _n /= 10
        }
        s.reverse()
        // 31023
        // 31999

        var res = 0
        for i in 0 ..< s.count {
            var left = 0, right = 0, bit = 1
            for j in 0 ..< i {
                left = left * 10 + s[j]
            }

            for j in i + 1 ..< s.count {
                right = right * 10 + s[j]
                bit *= 10
            }

            res += left * bit
            if s[i] == 1 { res = res + right + 1 }
            else if s[i] > 1 { res += bit }
        }
        return res
    }
}
// @lc code=end

