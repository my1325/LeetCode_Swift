/*
 * @lc app=leetcode.cn id=25 lang=swift
 *
 * [25] K 个一组翻转链表
 *
 * https://leetcode-cn.com/problems/reverse-nodes-in-k-group/description/
 *
 * algorithms
 * Hard (64.01%)
 * Likes:    915
 * Dislikes: 0
 * Total Accepted:    136K
 * Total Submissions: 212K
 * Testcase Example:  '[1,2,3,4,5]\n2'
 *
 * 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。
 * 
 * k 是一个正整数，它的值小于或等于链表的长度。
 * 
 * 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。
 * 
 * 
 * 
 * 示例：
 * 
 * 给你这个链表：1->2->3->4->5
 * 
 * 当 k = 2 时，应当返回: 2->1->4->3->5
 * 
 * 当 k = 3 时，应当返回: 3->2->1->4->5
 * 
 * 
 * 
 * 说明：
 * 
 * 
 * 你的算法只能使用常数的额外空间。
 * 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。
 * 
 * 
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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k == 1 { return head } 

        var length = 0 
        var _head = head
        while let node = _head {
            _head = _head?.next
            length += 1
        }

        let _count = length / k

        return _reverseKGroup(head, k, 0, _count)
    }

    func _reverseKGroup(_ head: ListNode?, _ k: Int, _ count: Int, _ total: Int) -> ListNode? {
        guard count < total else { return head } 
        
        var _count = 1
        var _retHead: ListNode? = head
        var _temp: ListNode? = head?.next
        var _pNext: ListNode? = head
        var _current: ListNode? = head
        while _count < k {
            _pNext = _temp?.next
            _temp?.next = _retHead
            _retHead = _temp
            _temp = _pNext
            _count += 1
        }
        _current?.next = _reverseKGroup(_pNext, k, count + 1, total)

        return _retHead
    }
}
// @lc code=end

