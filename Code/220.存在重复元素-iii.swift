/*
 * @lc app=leetcode.cn id=220 lang=swift
 *
 * [220] 存在重复元素 III
 *
 * https://leetcode-cn.com/problems/contains-duplicate-iii/description/
 *
 * algorithms
 * Medium (28.69%)
 * Likes:    493
 * Dislikes: 0
 * Total Accepted:    62.9K
 * Total Submissions: 219.2K
 * Testcase Example:  '[1,2,3,1]\n3\n0'
 *
 * 给你一个整数数组 nums 和两个整数 k 和 t 。请你判断是否存在 两个不同下标 i 和 j，使得 abs(nums[i] - nums[j])
 * ，同时又满足 abs(i - j)  。
 * 
 * 如果存在则返回 true，不存在返回 false。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：nums = [1,2,3,1], k = 3, t = 0
 * 输出：true
 * 
 * 示例 2：
 * 
 * 
 * 输入：nums = [1,0,1,1], k = 1, t = 2
 * 输出：true
 * 
 * 示例 3：
 * 
 * 
 * 输入：nums = [1,5,9,1,5,9], k = 2, t = 3
 * 输出：false
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 0 
 * -2^31 
 * 0 
 * 0 
 * 
 * 
 */

// @lc code=start
class Solution {
    var _k = 0
    var c: [Int: Int] = [:]
    var o: [Int] = []
    var s: [Int] = []
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard k > 0 else { return false }
        _k = k; o = nums
        for i in 0 ..< nums.count {
            if !s.isEmpty {
                let a = nums[i], b = around(a)
                if abs(a - b) <= t {
                    return true
                }
            }

            c[nums[i]] = i
            insert(nums[i], i)
        }
        return false 
    }

    func around(_ val: Int) -> Int {
        if (s.count == 1) { return s[0] }
        else {
            let i = findPrev(val)
            if i == s.count - 1 { return s[i] }
            else if i == 0, s[0] >= val { return s[0] }
            else {
                let ne = i + 1
                if val - s[i] < s[ne] - val {
                    return s[i]
                } else {
                    return s[ne]
                }
            }
        }
    }

    func insert(_ val: Int, _ index: Int) {
        defer { c[val] = index }
        if s.isEmpty || (s.count == 1 && s[0] < val) {
            s.append(val)
        } else if s.count == 1 {
            s.insert(val, at: 0)
        } else {
            let i = findPrev(val)
            if i == 0, s[0] >= val {
                s.insert(val, at: 0)
            } else if i == s.count - 1 {
                s.append(val)
            } else {
                s.insert(val, at: i + 1)
            }
        }
        if _k == s.count - 1 { 
            let h = index - _k
            print("remove \(o[h])")
            removeFirst(o[h])
        }
    }
    
    func removeFirst(_ val: Int) {
        var l = 0, r = s.count - 1
        while (l < r) {
            let m = (l + r) / 2
            if s[m] >= val { r = m } 
            else { l = m + 1 }
        }
        s.remove(at: r)
    }

    func findPrev(_ val: Int) -> Int {
        var l = 0, r = s.count - 1
        while (l < r) {
            let m = (l + r + 1) / 2
            if (s[m] >= val) { r = m - 1 }
            else { l = m }
        }
        return r
    }
}
// @lc code=end

