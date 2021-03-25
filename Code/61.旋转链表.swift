/*
 * @lc app=leetcode.cn id=61 lang=swift
 *
 * [61] 旋转链表
 *
 * https://leetcode-cn.com/problems/rotate-list/description/
 *
 * algorithms
 * Medium (40.63%)
 * Likes:    452
 * Dislikes: 0
 * Total Accepted:    122.8K
 * Total Submissions: 302.4K
 * Testcase Example:  '[1,2,3,4,5]\n2'
 *
 * 给定一个链表，旋转链表，将链表每个节点向右移动 k 个位置，其中 k 是非负数。
 * 
 * 示例 1:
 * 
 * 输入: 1->2->3->4->5->NULL, k = 2
 * 输出: 4->5->1->2->3->NULL
 * 解释:
 * 向右旋转 1 步: 5->1->2->3->4->NULL
 * 向右旋转 2 步: 4->5->1->2->3->NULL
 * 
 * 
 * 示例 2:
 * 
 * 输入: 0->1->2->NULL, k = 4
 * 输出: 2->0->1->NULL
 * 解释:
 * 向右旋转 1 步: 2->0->1->NULL
 * 向右旋转 2 步: 1->2->0->NULL
 * 向右旋转 3 步: 0->1->2->NULL
 * 向右旋转 4 步: 2->0->1->NULL
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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil else { return head }
        
        var length = 1
        var retHead = head
        while let node = retHead?.next {
            length += 1
            retHead = node
        }

        var _k = k
        if k > length {
            _k = k % length
        }
        return _rotateRight(head, retHead, _k, length - _k)
    }

    func _rotateRight(_ head: ListNode?, _ tail: ListNode?, _ k: Int, _ offset: Int) -> ListNode? {
        guard k > 0, offset > 0 else { return head }
        var count = 1
        var pHead = head

        while count < offset {
            pHead = pHead?.next
            count += 1
        }

        tail?.next = head 
        let newHead = pHead?.next 
        pHead?.next = nil
        return newHead
    }
}
// @lc code=end

