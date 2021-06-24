/*
 * @lc app=leetcode.cn id=215 lang=swift
 *
 * [215] 数组中的第K个最大元素
 *
 * https://leetcode-cn.com/problems/kth-largest-element-in-an-array/description/
 *
 * algorithms
 * Medium (64.64%)
 * Likes:    1145
 * Dislikes: 0
 * Total Accepted:    357.8K
 * Total Submissions: 553.5K
 * Testcase Example:  '[3,2,1,5,6,4]\n2'
 *
 * 在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
 * 
 * 示例 1:
 * 
 * 输入: [3,2,1,5,6,4] 和 k = 2
 * 输出: 5
 * 
 * 
 * 示例 2:
 * 
 * 输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
 * 输出: 4
 * 
 * 说明: 
 * 
 * 你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。
 * 
 */

// @lc code=start
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var _nums = nums
        return findKthLargest(&_nums, 0, nums.count - 1, k - 1)
    }

    func findKthLargest(_ s: inout [Int], _ l: Int, _ r: Int, _ k: Int) -> Int {
        guard l < r else { return s[k] }
        
        var x = s[l], i = l - 1, j = r + 1
        while i < j {
            i += 1
            while s[i] > x {
                i += 1
            }

            j -= 1
            while s[j] < x {
                j -= 1
            }

            if i < j {
                let t = s[i]
                s[i] = s[j]
                s[j] = t
            }
        }

        if k > j { return findKthLargest(&s, j + 1, r, k) }
        else {
            return findKthLargest(&s, l, j, k)
        }
    }
}
// @lc code=end

