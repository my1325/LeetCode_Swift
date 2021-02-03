/*
 * @lc app=leetcode.cn id=206 lang=swift
 *
 * [206] 反转链表
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
//                  P    pN
// _p, pN, temp
//1 <- 2 <- 3 <- 4 <- 5 <- nil
//1 -> 2 -> 3 -> 4 <- 5 <- nil
// 1 -> 2 -> 3 <- 4 <- 5 -> nil
// _p = _p.next.next
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let _head = head else { return head }

        var p = head 
        var pNext = head?.next
        var pTemp = head?.next?.next
        while pNext != nil {
            pNext?.next = p
            p = pNext
            pNext = pTemp
            pTemp = pTemp?.next
        }
        _head.next = nil
        return p
    }
    
    func reverseList1(_ head: ListNode?) -> ListNode? {
        guard let _head = head else { return head }

        let last = reverseList(_head.next)
        _head.next?.next = _head
        _head.next = nil 
        return last ?? _head
    }
}
// @lc code=end

