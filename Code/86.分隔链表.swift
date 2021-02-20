/*
 * @lc app=leetcode.cn id=86 lang=swift
 *
 * [86] 分隔链表
 *
 * https://leetcode-cn.com/problems/partition-list/description/
 *
 * algorithms
 * Medium (62.36%)
 * Likes:    358
 * Dislikes: 0
 * Total Accepted:    86.9K
 * Total Submissions: 139.3K
 * Testcase Example:  '[1,4,3,2,5,2]\n3'
 *
 * 给你一个链表和一个特定值 x ，请你对链表进行分隔，使得所有小于 x 的节点都出现在大于或等于 x 的节点之前。
 * 
 * 你应当保留两个分区中每个节点的初始相对位置。
 * 
 * 
 * 
 * 示例：
 * 
 * 
 * 输入：head = 1->4->3->2->5->2, x = 3
 * 输出：1->2->2->4->3->5
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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        return partitionUseSimpleMethod(head, x)
        // return partitionUseRecursive(head, x)
    }

    // var last: ListNode?
    // func partitionUseRecursive(_ head: ListNode?, _ x: Int) -> ListNode? {
    //     guard let _head = head else { return nil }
    //     if _head.val < x {
    //         last?.next = _head
    //         last = _head
    //     }
    //     _head.next = partitionUseRecursive(_head.next, x)
    //     return _head
    // }

    func partitionUseSimpleMethod(_ head: ListNode?, _ x: Int) -> ListNode? {
        var newHead: ListNode? = ListNode(0)
        newHead?.next = head
        var start = newHead 
        var last = newHead
        while let node = start?.next {
            if node.val < x {
                start?.next = node.next
                node.next = last?.next   
                last?.next = node 
            } 
            /// 如果start的next发生了交换，则需要判断下一个是否可以比x小
            /// 如果没有做交换则指向下一个
            if node === start?.next {
                start = start?.next
            }
            
            if let next = last?.next, next.val < x {
                last = next
            } 
        }
        return newHead?.next
    }
}
// @lc code=end

