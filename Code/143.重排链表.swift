/*
 * @lc app=leetcode.cn id=143 lang=swift
 *
 * [143] 重排链表
 *
 * https://leetcode-cn.com/problems/reorder-list/description/
 *
 * algorithms
 * Medium (59.50%)
 * Likes:    547
 * Dislikes: 0
 * Total Accepted:    87.4K
 * Total Submissions: 145.9K
 * Testcase Example:  '[1,2,3,4]'
 *
 * 给定一个单链表 L：L0→L1→…→Ln-1→Ln ，
 * 将其重新排列后变为： L0→Ln→L1→Ln-1→L2→Ln-2→…
 * 
 * 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 * 
 * 示例 1:
 * 
 * 给定链表 1->2->3->4, 重新排列为 1->4->2->3.
 * 
 * 示例 2:
 * 
 * 给定链表 1->2->3->4->5, 重新排列为 1->5->2->4->3.
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

 
    func reorderList(_ head: ListNode?) {
        _reorderList(head)
    }

    func _reorderList(_ head: ListNode?) {
        guard head?.next?.next != nil else { return }
        var slowNode: ListNode? = head
        var fastNode: ListNode? = head
        while fastNode != nil && fastNode?.next != nil {
            slowNode = slowNode?.next 
            fastNode = fastNode?.next?.next
        }

        /// 找到中间结点
        _currentNode = head 
        __reorderList(slowNode?.next)
        slowNode?.next = nil
    }

    var _currentNode: ListNode?
    func __reorderList(_ currentNode: ListNode?) {
        if let next = currentNode?.next { 
            __reorderList(next) 
        }

        let tempNode = _currentNode?.next
        _currentNode?.next = currentNode
        currentNode?.next = tempNode
        _currentNode = tempNode
    }
}
// @lc code=end

