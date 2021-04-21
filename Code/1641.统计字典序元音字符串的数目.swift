/*
 * @lc app=leetcode.cn id=1641 lang=swift
 *
 * [1641] 统计字典序元音字符串的数目
 *
 * https://leetcode-cn.com/problems/count-sorted-vowel-strings/description/
 *
 * algorithms
 * Medium (77.29%)
 * Likes:    48
 * Dislikes: 0
 * Total Accepted:    10K
 * Total Submissions: 13K
 * Testcase Example:  '1'
 *
 * 给你一个整数 n，请返回长度为 n 、仅由元音 (a, e, i, o, u) 组成且按 字典序排列 的字符串数量。
 *
 * 字符串 s 按 字典序排列 需要满足：对于所有有效的 i，s[i] 在字母表中的位置总是与 s[i+1] 相同或在 s[i+1] 之前。
 *
 *
 *
 * 示例 1：
 *
 *
 * 输入：n = 1
 * 输出：5
 * 解释：仅由元音组成的 5 个字典序字符串为 ["a","e","i","o","u"]
 *
 *
 * 示例 2：
 *
 *
 * 输入：n = 2
 * 输出：15
 * 解释：仅由元音组成的 15 个字典序字符串为
 * ["aa","ae","ai","ao","au","ee","ei","eo","eu","ii","io","iu","oo","ou","uu"]
 * 注意，"ea" 不是符合题意的字符串，因为 'e' 在字母表中的位置比 'a' 靠后
 *
 *
 * 示例 3：
 *
 *
 * 输入：n = 33
 * 输出：66045
 *
 *
 *
 *
 * 提示：
 *
 *
 * 1
 *
 *
 */

// @lc code=start
class Solution {
    func countVowelStrings(_ n: Int) -> Int {
        var a = 1, e = 1, i = 1, o = 1, u = 1
        for _ in 0 ..< n {
            a = a + e + i + o + u
            e = e + i + o + u
            i = i + o + u
            o = o + u
        }
        return a
    }

    func _countVowelStrings(_ n: Int) -> Int {
        return a(n) + e(n) + i(n) + o(n) + u(n)
    }

    func a(_ n: Int) -> Int {
        if n == 1 { return 1 }
        return a(n - 1) + e(n - 1) + i(n - 1) + o(n - 1) + u(n - 1)
    }

    func e(_ n: Int) -> Int {
        if n == 1 { return 1 }
        return e(n - 1) + i(n - 1) + o(n - 1) + u(n - 1)
    }

    func i(_ n: Int) -> Int {
        if n == 1 { return 1 }
        return i(n - 1) + o(n - 1) + u(n - 1)
    }

    func o(_ n: Int) -> Int {
        if n == 1 { return 1 }
        return o(n - 1) + u(n - 1)
    }

    func u(_ n: Int) -> Int {
        return 1
    }
}

// @lc code=end
