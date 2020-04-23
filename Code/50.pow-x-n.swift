/*
 * @lc app=leetcode.cn id=50 lang=swift
 *
 * [50] Pow(x, n)
 */

// @lc code=start
class Solution {
    /// 迭代
    func myPow(_ x: Double, _ n: Int) -> Double {
        var absn = abs(n)
        var result: Double = 1
        var xr = x
        while absn != 0 {
            if ((absn & 1) == 1) {
                result *= xr
            }
            xr *= xr
            absn >>= 1
        }
        return n > 0 ? result : 1 / result
    }

    /// 递归
    func myPow1(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1 }
       
        if n > 0 {
            var result = myPow(x, n >> 1)
            result *= result
            return (n & 1) == 0 ? result : result * x
        } else {
            let absn = 0 - n
            var result = myPow(x, absn >> 1)
            result *= result
            return (n & 1) == 0 ? 1 / result : 1 / (result * x)
        }

    }
}
// @lc code=end

