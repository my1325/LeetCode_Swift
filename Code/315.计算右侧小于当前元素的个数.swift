/*
 * @lc app=leetcode.cn id=315 lang=swift
 *
 * [315] 计算右侧小于当前元素的个数
 *
 * https://leetcode-cn.com/problems/count-of-smaller-numbers-after-self/description/
 *
 * algorithms
 * Hard (41.84%)
 * Likes:    638
 * Dislikes: 0
 * Total Accepted:    49.2K
 * Total Submissions: 117.5K
 * Testcase Example:  '[5,2,6,1]'
 *
 * 给定一个整数数组 nums，按要求返回一个新数组 counts。数组 counts 有该性质： counts[i] 的值是  nums[i] 右侧小于
 * nums[i] 的元素的数量。
 * 
 * 
 * 
 * 示例：
 * 
 * 输入：nums = [5,2,6,1]
 * 输出：[2,1,1,0] 
 * 解释：
 * 5 的右侧有 2 个更小的元素 (2 和 1)
 * 2 的右侧仅有 1 个更小的元素 (1)
 * 6 的右侧有 1 个更小的元素 (1)
 * 1 的右侧有 0 个更小的元素
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 0 <= nums.length <= 10^5
 * -10^4 <= nums[i] <= 10^4
 * 
 * 
 */

// @lc code=start
class Solution {
    var s: [Int] = []
    func countSmaller(_ nums: [Int]) -> [Int] {
        var c: [Int] = []
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            if !s.isEmpty { 
                let j = findPre(nums[i])
                if j == 0, s[j] >= nums[i] {
                    c.append(0)
                } else {
                    c.append(j + 1)
                }
            } else {
                c.append(0)
            }
            insert(nums[i])
        }
        c.reverse()        
        return c
    }

    func insert(_ val: Int) {
        if s.isEmpty {
            s.append(val)
        } else if s.count == 1 {
            if s[0] >= val {
                s.insert(val, at: 0)
            } else {
                s.append(val)
            }
        } else {
            let i = findPre(val)
            if i == 0, s[0] >= val {
                s.insert(val, at: 0)
            } else if i == s.count - 1 { 
                s.append(val) 
            } else { 
                s.insert(val, at: i + 1) 
            }
        }
    }

    func findPre(_ val: Int) -> Int {
        var l = 0, r = s.count - 1
        while l < r {
            let m = (l + r + 1) / 2
            if s[m] >= val { r = m - 1 }
            else { l = m }
        }
        return r
    }
}
// @lc code=end

