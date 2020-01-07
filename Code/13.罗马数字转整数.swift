/*
 * @lc app=leetcode.cn id=13 lang=swift
 *
 * [13] 罗马数字转整数
 */

// @lc code=start
class Solution {
    func romanToInt(_ s: String) -> Int {
//        value - lastValue
        let romanIntMan: [String: Int] = ["I": 1, "IV": 3, "V": 5, "IX": 8, "X": 10, "XL": 30, "L": 50, "XC": 80, "C": 100, "CD": 300, "D": 500, "CM": 800, "M": 1000]
        var sum: Int = romanIntMan[String(s.first!)] ?? 0
        for index in 1 ..< s.count {
            guard index > 0 else { continue }
            
            let lSI = s.index(s.startIndex, offsetBy: index - 1)
            let endIndex = s.index(s.startIndex, offsetBy: index + 1)
            let lSStr = s[lSI ..< endIndex]
            if let last = romanIntMan[String(lSStr)] {
                sum += last
            } else {
                let startIndex = s.index(s.startIndex, offsetBy: index)
                let subStr = s[startIndex ..< endIndex]
                let current = romanIntMan[String(subStr)]
                sum += current!
            }
        }
        return sum
    }
    
    func romanToInt1(_ s: String) -> Int {
        let romanOrder: [String] = ["I", "V", "X", "L", "C", "D", "M"]
        let singleRomanInt: [String: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        let doubleRomanInt: [String: Int] = ["IV": 4, "IX": 9, "XL": 40, "XC": 90, "CD": 400, "CM": 900]
        var result: Int = 0
        
        var lastRomanChar: String?
        for char in s {
            
            if let lastChar = lastRomanChar,
                let lastCharIndex = romanOrder.firstIndex(of: lastChar),
                let currentIndex = romanOrder.firstIndex(of: String(char)),
                lastCharIndex < currentIndex,
                let value = doubleRomanInt[lastChar + String(char)] {
                if let lastValue = singleRomanInt[lastChar] {
                    result = result + value - lastValue
                }
            } else if let intValue = singleRomanInt[String(char)] {
                result += intValue
            }
            lastRomanChar = String(char)
        }
        
        return result
    }
}
// @lc code=end

