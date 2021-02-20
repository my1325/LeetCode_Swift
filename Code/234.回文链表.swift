/*
 * @lc app=leetcode.cn id=234 lang=swift
 *
 * [234] 回文链表
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
    func isPalindrome(_ head: ListNode?) -> Bool {
        // leaf = head
        // return isPalindromeUseRecursive(head)
        return isPalindromeUseStack(head)
        // return isPalindromeUseQuickSlowPointer(head)
    }
    
    /// 利用递归来做前后对比
    var leaf: ListNode?
    func isPalindromeUseRecursive(_ head: ListNode?) -> Bool {
        guard let _head = head else { return true }
        let isPalindrome = isPalindromeUseRecursive(head?.next)
        if isPalindrome, leaf?.val == head?.val {
             leaf = leaf?.next
             return true 
        }
        return false 
    }

    /// 利用栈来做前后对比
    func isPalindromeUseStack(_ head: ListNode?) -> Bool {            
        var stack: [ListNode] = []
        var start = head
        while let node = start {
            stack.append(node)
            start = start?.next
        }
        start = head
        while let node = stack.last {
            if start?.val == node.val {
                stack.removeLast()
                start = start?.next
                continue
            }
            return false 
        }
        return true 
    }

    /// 快慢指针，反转链表后半部分
    func isPalindromeUseQuickSlowPointer(_ head: ListNode?) -> Bool {
        var quick = head
        var slow = head
        if quick?.next == nil {
            return true 
        } else if quick?.next?.next == nil {
            return slow?.val == quick?.next?.val
        }

        while quick != nil {
            quick = quick?.next?.next
            slow = slow?.next
        }

        var start0 = head 
        var start1 = reverseList1(slow)

        while start1 != nil {
            if start0?.val == start1?.val { 
                start0 = start0?.next 
                start1 = start1?.next
                continue 
            }

            return false 
        }
        return true 
    }

    func reverseList1(_ head: ListNode?) -> ListNode? {
        guard let _head = head else { return head }

        let last = reverseList1(_head.next)
        _head.next?.next = _head
        _head.next = nil 
        return last ?? _head
    }
}
// @lc code=end

