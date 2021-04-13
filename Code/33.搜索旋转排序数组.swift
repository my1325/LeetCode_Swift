/*
 * @lc app=leetcode.cn id=33 lang=swift
 *
 * [33] 搜索旋转排序数组
 *
 * https://leetcode-cn.com/problems/search-in-rotated-sorted-array/description/
 *
 * algorithms
 * Medium (41.01%)
 * Likes:    1321
 * Dislikes: 0
 * Total Accepted:    261.2K
 * Total Submissions: 630.9K
 * Testcase Example:  '[4,5,6,7,0,1,2]\n0'
 *
 * 整数数组 nums 按升序排列，数组中的值 互不相同 。
 * 
 * 在传递给函数之前，nums 在预先未知的某个下标 k（0 ）上进行了 旋转，使数组变为 [nums[k], nums[k+1], ...,
 * nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如，
 * [0,1,2,4,5,6,7] 在下标 3 处经旋转后可能变为 [4,5,6,7,0,1,2] 。
 * 
 * 给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的下标，否则返回 -1 。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：nums = [4,5,6,7,0,1,2], target = 0
 * 输出：4
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：nums = [4,5,6,7,0,1,2], target = 3
 * 输出：-1
 * 
 * 示例 3：
 * 
 * 
 * 输入：nums = [1], target = 0
 * 输出：-1
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 
 * -10^4 
 * nums 中的每个值都 独一无二
 * 题目数据保证 nums 在预先未知的某个下标上进行了旋转
 * -10^4 
 * 
 * 
 * 
 * 
 * 进阶：你可以设计一个时间复杂度为 O(log n) 的解决方案吗？
 * 
 */

// @lc code=start
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 1 else { return nums[0] == target ? 0 : -1 }
        var begin = 0, end = nums.count - 1
        while end - begin > 1 {
            var mid = (begin + end) / 2
            
            if nums[mid] == target {
                return mid 
            }

            if nums[begin] < nums[mid] && target >= nums[begin] && target < nums[mid] {
                end = mid
            } else if nums[begin] < nums[mid] || (target > nums[mid] && target <= nums[end]) {     
                begin = mid
            } else {    
                end = mid 
            }
            
        }

        if nums[begin] == target {
            return begin
        } else if nums[end] == target {
            return end 
        } else {
            return -1
        }
    }
}
// @lc code=end

