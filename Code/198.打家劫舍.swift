/*
 * @lc app=leetcode.cn id=198 lang=swift
 *
 * [198] 打家劫舍
 */

// @lc code=start
class Solution {
    
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        } 

        var first = 0
        var second = 0
        
        for index in 0 ..< nums.count {
            let tempSecond = second
            second = max(nums[index] + first, second)
            first = tempSecond
        }
        return second
    }
    
    func rob1(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        return rob(nums, from: 0)
    }

    func rob(_ nums: [Int], from index: Int) -> Int {
        if index == nums.count - 1 {
            return nums[index]
        } else if index == nums.count - 2 {
            return max(nums[index], nums[index + 1])
        }
        return max(nums[index] + rob(nums, from: index + 2), rob(nums, from: index + 1))
    }
}
// @lc code=end

