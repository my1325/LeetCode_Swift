/*
 * @lc app=leetcode.cn id=179 lang=swift
 *
 * [179] 最大数
 *
 * https://leetcode-cn.com/problems/largest-number/description/
 *
 * algorithms
 * Medium (40.85%)
 * Likes:    730
 * Dislikes: 0
 * Total Accepted:    105.7K
 * Total Submissions: 258.9K
 * Testcase Example:  '[10,2]'
 *
 * 给定一组非负整数 nums，重新排列每个数的顺序（每个数不可拆分）使之组成一个最大的整数。
 * 
 * 注意：输出结果可能非常大，所以你需要返回一个字符串而不是整数。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：nums = [10,2]
 * 输出："210"
 * 
 * 示例 2：
 * 
 * 
 * 输入：nums = [3,30,34,5,9]
 * 输出："9534330"
 * 
 * 
 * 示例 3：
 * 
 * 
 * 输入：nums = [1]
 * 输出："1"
 * 
 * 
 * 示例 4：
 * 
 * 
 * 输入：nums = [10]
 * 输出："10"
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

    func compare(_ a: Int, _ b: Int) -> Bool {
        let aa = Int(String(format: "%d%d", a, b))!
        let bb = Int(String(format: "%d%d", b, a))!
        return aa < bb
    }

    func compare1(_ a: Int, _ b: Int) -> Bool {
        let aa = Int(String(format: "%d%d", a, b))!
        let bb = Int(String(format: "%d%d", b, a))!
        return aa > bb
    }

    func largestNumber(_ nums: [Int]) -> String {
        guard !nums.isEmpty else { return "" }
        guard nums.count > 1 else { return String(nums[0]) }
        var _s = nums
        sort(&_s, 0, nums.count - 1)
        var res = ""
        var isZero = true 
        for i in stride(from: _s.count - 1, through: 0, by: -1) {
            if isZero, _s[i] == 0 { continue }
            isZero = false 
            res.append(String(_s[i]))
        }
        return res.isEmpty ? "0" : res
    }

    func sort(_ s: inout [Int], _ l: Int, _ r: Int) {
        guard l < r else { return }
        var i = l - 1, j = r + 1
        let x = s[l]
        while i < j {
            i += 1
            while compare(s[i], x) { i += 1 }
            j -= 1
            while compare1(s[j], x) { j -= 1 }
            if i < j {
                let t = s[i]
                s[i] = s[j]
                s[j] = t
            }
        }
        sort(&s, l, j); sort(&s, j + 1, r)
    }
}
// @lc code=end

