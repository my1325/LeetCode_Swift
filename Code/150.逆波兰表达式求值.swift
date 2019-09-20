/*
 * @lc app=leetcode.cn id=150 lang=swift
 *
 * [150] 逆波兰表达式求值
 */
class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var newTokens: [String] = []
        for token in tokens {
            switch token {
            case "+":
                newTokens.append(String(Int(newTokens.removeLast())! + Int(newTokens.removeLast())!))
            case "*":
                newTokens.append(String(Int(newTokens.removeLast())! * Int(newTokens.removeLast())!))
            case "-":
                newTokens.append(String(-Int(newTokens.removeLast())! + Int(newTokens.removeLast())!))
            case "/":
                let right = Int(newTokens.removeLast())!
                let left = Int(newTokens.removeLast())!
                newTokens.append(String(left / right))
            default:
                newTokens.append(token)
            }    
        }
        return Int(newTokens.removeLast())!
    }
}

