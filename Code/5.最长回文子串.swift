/*
 * @lc app=leetcode.cn id=5 lang=swift
 *
 * [5] 最长回文子串
 */

// @lc code=start
class Solution {
    
    func longestPalindrome(_ s: String) -> String {
        
        /// 解决ji
        let list = ("#" + s.map({ String($0) }).joined(separator: "#") + "#").map({ $0 })
                    
        var middleIndex = (list.count + 1) / 2 - 1
        for index in 0 ..< list.count {
            list[index] == list[middleIndex - index + middleIndex]
        }
    }
}
// @lc code=end

