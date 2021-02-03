/*
 * @lc app=leetcode.cn id=92 lang=swift
 *
 * [92] 反转链表 II
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


class Solution {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        // if m == 1 {
        //     return reverseN(head, n)
        // }
        // head?.next = reverseBetween(head?.next, m - 1, n - 1)
        // return head
        return reverseBetweenUsingIteration(head, m, n)
    }

/// 1->2->3->4
/// _p, _cp
/// 1->2->3<-4
/// 1->2<-3<-4
    var successer: ListNode?
    func reverseN(_ head: ListNode?, _ m: Int) -> ListNode? {
        guard let _head = head else { return head }
        if m == 1 {
            successer = _head.next
            return _head
        }

        let last = reverseN(_head.next, m - 1)
        _head.next?.next = _head
        _head.next = successer
        return last
    }


    func reverseBetweenUsingIteration(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        guard let _head = head, m != n else { return head }

        var p = head
        var newHead: ListNode? = head
        var newEnd: ListNode?
        var precursor: ListNode?
        for index in 0 ..< n {
            if index == m - 2 {
                newHead = p?.next
                precursor = p 
            }
            p = p?.next
        }

        newEnd = p 
        print(newHead?.val)
        print(newEnd?.val)

        let _reverseHead = reverseList(newHead, newEnd)
        precursor?.next = _reverseHead
        if p != nil {
            newHead?.next = p
        }
        
        return m == 1 ? _reverseHead : _head
    }

    func reverseList(_ head: ListNode?, _ end: ListNode?) -> ListNode? {
        guard let _head = head else { return head }

        var p = head 
        var pNext = head?.next
        var pTemp = head?.next?.next
        while !(pNext === end) {
            pNext?.next = p
            p = pNext
            pNext = pTemp
            pTemp = pTemp?.next
        }
        _head.next = nil
        return p
    }
}
// @lc code=end

