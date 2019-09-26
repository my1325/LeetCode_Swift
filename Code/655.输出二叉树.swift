/*
 * @lc app=leetcode.cn id=655 lang=swift
 *
 * [655] 输出二叉树
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 *
 *[["",  "",  "", "",  "", "", "", "1", "",  "",  "",  "",  "", "", ""]   1 - 8
 ["",  "",  "", "2", "", "", "", "",  "",  "",  "",  "5", "", "", ""]    2 - 4， 12
 ["",  "3", "", "",  "", "3", "", "",  "3",  "",  "",  "",  "", "3", ""]     3 - 2，
 ["4", "",  "4", "4",  "", "4", "4", "",  "4",  "",  "",  "",  "4", "", "4"]]
 */
class Solution {
    func printTree(_ root: TreeNode?) -> [[String]] {
        guard let node = root else { return [] }
//        n = 2^(m +1) - 1
        let deep = deepthOfTree(node, currentDeepth: 1)
        let count = 2 << (deep - 1) - 1
        let retArray: [[String]] = Array<[String]>(repeating: Array<String>(repeating: "", count: count), count: deep)
        return putNode(node, deep: 0, start: 0, end: count, currentList: retArray)
    }
    
    
    /// 放当前的节点
    /// - Parameter node: 当前节点
    /// - Parameter deep: 当前的深度
    /// - Parameter start: 起始的位置
    /// - Parameter end: 末尾位置
    /// - Parameter currentList: 当前的数组
    private func putNode(_ node: TreeNode, deep: Int, start: Int, end: Int, currentList: [[String]]) -> [[String]] {
        var currentList = currentList
        let insert = start + (end - start) / 2
        currentList[deep][insert] = "\(node.val)"
        
        if let left = node.left {
            currentList = putNode(left, deep: deep + 1, start: start, end: insert - 1, currentList: currentList)
        }
        
        if let right = node.right {
            currentList = putNode(right, deep: deep + 1, start: insert + 1, end: end, currentList: currentList)
        }
        return currentList
    }
    
    private func deepthOfTree(_ root: TreeNode, currentDeepth: Int) -> Int {
        
        var leftDeep: Int?
        var rightDeep: Int?
        if let left = root.left {
            leftDeep = deepthOfTree(left, currentDeepth: currentDeepth)
        }
        
        if let right = root.right {
            rightDeep = deepthOfTree(right, currentDeepth: currentDeepth)
        }
        
        return currentDeepth + max(leftDeep ?? 0, rightDeep ?? 0)
    }
}

