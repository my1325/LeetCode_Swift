/*
 * @lc app=leetcode.cn id=9 lang=swift
 *
 * [9] 回文数
 */

// @lc code=start
class Solution {
    
    /// 字符串解法
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        let intString = "#" + String(x).map({ String($0) }).joined(separator: "#") + "#"
        let cMap: [Character] = intString.map({ $0 })
        let midIndex = (cMap.count + 1) / 2 - 1
        var offset: Int = 1
        while offset <= midIndex {
            if cMap[midIndex - offset] != cMap[midIndex + offset] {
                return false
            }
            offset += 1
        }
        return true
    }
    
    /// 整数翻转解法
    func isPalindrome1(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        var xTemp = Int64(x)
        var result: Int64 = 0
        while xTemp != 0 {
            let pop = xTemp % 10
            xTemp = xTemp / 10
            result = result * 10 + pop
        }
        return result == Int64(x)
    }
}
// @lc code=end

