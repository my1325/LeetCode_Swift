/*
 * @lc app=leetcode.cn id=7 lang=swift
 *
 * [7] 整数反转
 */

// @lc code=start
class Solution {
    func reverse(_ x: Int) -> Int {
        var temp: Int64 = 0
        var xTemp = Int64(x)
        while xTemp != 0 {
            let pop =  xTemp % 10
            xTemp = xTemp / 10
            temp = temp * 10 + pop
            if temp > Int32.max || temp < Int32.min { return 0 }
        }
        return Int(temp)
    }
}
// @lc code=end

