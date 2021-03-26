/*
 * @lc app=leetcode.cn id=148 lang=swift
 *
 * [148] 排序链表
 *
 * https://leetcode-cn.com/problems/sort-list/description/
 *
 * algorithms
 * Medium (67.62%)
 * Likes:    1006
 * Dislikes: 0
 * Total Accepted:    140.2K
 * Total Submissions: 207.5K
 * Testcase Example:  '[4,2,1,3]'
 *
 * 给你链表的头结点 head ，请将其按 升序 排列并返回 排序后的链表 。
 *
 * 进阶：
 *
 *
 * 你可以在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序吗？
 *
 *
 *
 *
 * 示例 1：
 *
 *
 * 输入：head = [4,2,1,3]
 * 输出：[1,2,3,4]
 *
 *
 * 示例 2：
 *
 *
 * 输入：head = [-1,5,3,4,0]
 * 输出：[-1,0,3,4,5]
 *
 *
 * 示例 3：
 *
 *
 * 输入：head = []
 * 输出：[]
 *
 *
 *
 *
 * 提示：
 *
 *
 * 链表中节点的数目在范围 [0, 5 * 10^4] 内
 * -10^5
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
    func sortList(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return head }
        return sort(head, nil)
    }

    func sort(_ head: ListNode?, _ tail: ListNode?) -> ListNode? {
        guard head != nil, !(head?.next === tail) else { return head }

        var pNode1: ListNode? = head
        var pNode2: ListNode? = head
        /// 快慢指针找链表中点
        while let node2 = pNode2 {
            if node2 === tail || node2.next?.next === tail {
                break
            }
            pNode1 = pNode1?.next
            pNode2 = node2.next?.next
        }

        let newHead = pNode1?.next
        pNode1?.next = nil
        /// 此时pNode1为链表中点
        let sortedList1 = sort(head, nil)
        let sortedList2 = sort(newHead, tail)
        return sortMerge(sortedList1, sortedList2)
    }

    func sortMerge(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let newHead = ListNode()
        var newList: ListNode? = newHead

        var pNode = list1
        var pNode2 = list2
        while let node = pNode, !(node === list2) {
            if let node2 = pNode2, node2.val < node.val {
                newList?.next = node2
                newList = node2
                pNode2 = node2.next
            } else if pNode2 != nil {
                pNode = node.next
                newList?.next = node
                newList = node
            } else {
                /// 此时list2已经排完了，则newList已经有序
                newList?.next = pNode
                newList = pNode
                break
            }
        }
        if pNode2 != nil {
            newList?.next = pNode2
        }
        return newHead.next
    }

    /// 冒泡
    func sortListWithBubble(_ head: ListNode?) -> ListNode? {
        guard let _head = head else { return head }
        var curNode: ListNode? = _head
        var pNode = head
        while let _curNode = curNode {
            pNode = curNode
            while let node = pNode?.next {
                pNode = node
                if node.val < _curNode.val {
                    let temp = _curNode.val
                    _curNode.val = node.val
                    node.val = temp
                }
            }
            curNode = _curNode.next
        }
        return head
    }
}

// @lc code=end
