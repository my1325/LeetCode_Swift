/*
 * @lc app=leetcode.cn id=23 lang=swift
 *
 * [23] 合并K个排序链表
 */
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    
    /// 逐一比较法，此算法swift会超时
    func mergeKListSolution1(_ lists: [ListNode?]) -> ListNode? {
        
        let head = ListNode(0)
        var cur: ListNode? = head
        var lists = lists
        while true {
           var minIndex = -1
           /// 找到当前链表的最小节点给cur
           for index in 0 ..< lists.count {
               guard lists[index] != nil else { continue }
               if minIndex == -1 || lists[minIndex]!.val > lists[index]!.val {
                   minIndex = index
               }
           }
           /// 如果此时minIndex = -1 则表示已经遍历结束
           if minIndex == -1 { break }
           cur?.next = lists[minIndex]
           cur = cur?.next
           lists[minIndex] = lists[minIndex]?.next
        }
        return head.next
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let node: ListNode = ListNode(0)
        var cur: ListNode? = node
        
        var templ1 = l1
        var templ2 = l2
        while templ1 != nil, templ2 != nil {
            if templ1!.val < templ2!.val {
                cur?.next = templ1
                cur = cur?.next
                templ1 = templ1?.next
            } else {
                cur?.next = templ2
                cur = cur?.next
                templ2 = templ2?.next
            }
        }

        if templ1 == nil {
            cur?.next = templ2
        } else if templ2 == nil {
            cur?.next = templ1
        }
        return node.next
    }
    
    /// 两两合并（每个链表都和第一个链表合并）
    func mergeKListsSolution2(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else { return lists.first as? ListNode }
        var lists = lists
        for index in 0 ..< lists.count - 1 {
          lists[0] = mergeTwoLists(lists[0], lists[index + 1])
        }
        return lists[0]
    }
    
    /// 分治
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else { return lists.first as? ListNode }

        var lists = lists
        var step = 1
        
        while step < lists.count {
            let nextStop = step << 1
            for index in stride(from: 0, to: lists.count - 1, by: nextStop) where index + step < lists.count {
                lists[index] = mergeTwoLists(lists[index], lists[index + step])
            }
            step = nextStop
        }
        return lists[0]
    }
}

