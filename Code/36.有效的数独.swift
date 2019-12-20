/*
 * @lc app=leetcode.cn id=36 lang=swift
 *
 * [36] 有效的数独
 */

// @lc code=start
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var hLines: [UInt16] = Array(repeating: 0, count: 9)
        var vLines: [UInt16] = Array(repeating: 0, count: 9)
        var boxLines: [UInt16] = Array(repeating: 0, count: 9)
        
        for hIndex in 0 ..< board.count {
            let line =  board[hIndex]
            for vIndex in 0 ..< line.count {
                let car = line[vIndex]
                guard String(car) != ".", let value = car.asciiValue else { continue }
                let bitValue = UInt16(1) << UInt16(value - 49)

                if hLines[vIndex] & bitValue != 0 { return false }
                if vLines[hIndex] & bitValue != 0 { return false }
                
                let boxIndex = (hIndex / 3) * 3 + vIndex / 3
                if boxLines[boxIndex] & bitValue != 0 { return false }
                    
                hLines[vIndex] |= bitValue
                vLines[hIndex] |= bitValue
                boxLines[boxIndex] |= bitValue
            }
        }
        return true
    }
    
    func isValidSudoku1(_ board: [[Character]]) -> Bool {
        var hLines: [[Character]] = Array(repeating: [], count: 9)
        var vLines: [[Character]] = Array(repeating: [], count: 9)
        var boxLines: [[Character]] = Array(repeating: [], count: 9)
        
        
        for hIndex in 0 ..< board.count {
            let line =  board[hIndex]
            for vIndex in 0 ..< line.count {
                let car = line[vIndex]
                guard String(car) != "." else { continue }
                if hLines[vIndex].contains(car) { return false }
                if vLines[hIndex].contains(car) { return false }
                
                let boxIndex = (hIndex / 3) * 3 + vIndex / 3
                if boxLines[boxIndex].contains(car) { return false }
                    
                hLines[vIndex].append(car)
                vLines[hIndex].append(car)
                boxLines[boxIndex].append(car)
            }
        }
        return true
    }
}
// @lc code=end

