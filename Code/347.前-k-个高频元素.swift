/*
 * @lc app=leetcode.cn id=347 lang=swift
 *
 * [347] 前 K 个高频元素
 */

// @lc code=start
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for index in 0 ..< nums.count {
            let num = nums[index]
            var numCount = map[num] ?? 0
            numCount += 1
            map[num] = numCount
        }
        return Array(map.sorted { (value1, value2) -> Bool in
            return value1.value > value2.value
        }.map({ $0.key })[0 ..< k])
    }
}
// @lc code=end

