/*
 * @lc app=leetcode.cn id=152 lang=swift
 *
 * [152] 乘积最大子数组
 *
 * https://leetcode-cn.com/problems/maximum-product-subarray/description/
 *
 * algorithms
 * Medium (41.27%)
 * Likes:    1045
 * Dislikes: 0
 * Total Accepted:    132.8K
 * Total Submissions: 321.2K
 * Testcase Example:  '[2,3,-2,4]'
 *
 * 给你一个整数数组 nums ，请你找出数组中乘积最大的连续子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。
 *
 *
 *
 * 示例 1:
 *
 * 输入: [-2,3,2,-4]
 * 输出: 6
 * 解释: 子数组 [2,3] 有最大乘积 6。
 *
 *
 * 示例 2:
 *
 * 输入: [-2,0,-1]
 * 输出: 0
 * 解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。
 *
 */

// @lc code=start
class Solution {

func maxProduct(_ nums: [Int]) -> Int {
   var _max = nums[0], _min = nums[0], _res = nums[0]
    for index in 1 ..< nums.count {
        let __max = _max, __min = _min
        _max = max(__max * nums[index], max(__min * nums[index], nums[index]))
        _min = min(__min * nums[index], min(__max * nums[index], nums[index]))
        _res = max(_res, _max)
    }
    return _res
}
    func _maxProduct(_ nums: [Int]) -> Int {
        var _max = nums[0]
        var _cacheTotalProduct: [Int] = nums
        var _cacheMaxProduct: [Int] = nums
        for index in 1 ..< nums.count {
            _cacheTotalProduct[index] = nums[index] * _cacheTotalProduct[index - 1]
            if (nums[index] < 0 && _cacheTotalProduct[index - 1] < 0) || (nums[index] > 0 && _cacheTotalProduct[index - 1] > 0) {
                _cacheMaxProduct[index] = _cacheTotalProduct[index]
            } else if nums[index] == 0 {
                _cacheMaxProduct[index] = 0
            } else {
                var _total: Int = nums[index]
                var _maxTotal = nums[index]
                for _index in stride(from: index - 1, through: 0, by: -1) {
                    _total *= nums[_index]
                    _maxTotal = max(_maxTotal, _total)
                }
                _cacheMaxProduct[index] = _maxTotal
            }

            _max = max(_max, _cacheMaxProduct[index])
        }
        return _max
    }
}

// @lc code=end
