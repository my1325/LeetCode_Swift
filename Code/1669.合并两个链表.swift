/*
 * @lc app=leetcode.cn id=1669 lang=swift
 *
 * [1669] 合并两个链表
 *
 * https://leetcode-cn.com/problems/merge-in-between-linked-lists/description/
 *
 * algorithms
 * Medium (78.24%)
 * Likes:    9
 * Dislikes: 0
 * Total Accepted:    5.4K
 * Total Submissions: 6.9K
 * Testcase Example:  '[0,1,2,3,4,5]\n3\n4\n[1000000,1000001,1000002]'
 *
 * 给你两个链表 list1 和 list2 ，它们包含的元素分别为 n 个和 m 个。
 * 
 * 请你将 list1 中第 a 个节点到第 b 个节点删除，并将list2 接在被删除节点的位置。
 * 
 * 下图中蓝色边和节点展示了操作后的结果：
 * 
 * 请你返回结果链表的头指针。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 
 * 
 * 输入：list1 = [0,1,2,3,4,5], a = 3, b = 4, list2 = [1000000,1000001,1000002]
 * 输出：[0,1,2,1000000,1000001,1000002,5]
 * 解释：我们删除 list1 中第三和第四个节点，并将 list2 接在该位置。上图中蓝色的边和节点为答案链表。
 * 
 * 
 * 示例 2：
 * 
 * 
 * 输入：list1 = [0,1,2,3,4,5,6], a = 2, b = 5, list2 =
 * [1000000,1000001,1000002,1000003,1000004]
 * 输出：[0,1,1000000,1000001,1000002,1000003,1000004,6]
 * 解释：上图中蓝色的边和节点为答案链表。
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 3 
 * 1 
 * 1 
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
    func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        let newHead = ListNode(0)
        newHead.next = list1
        var _count = 0 
        var pre: ListNode? = newHead
        var pre0: ListNode? = newHead
        while _count <= b {
            if _count == a {
                pre0 = pre
            }     
            pre = pre?.next
            _count += 1
        }

        var pre2: ListNode? = list2 
        while pre2?.next != nil {
            pre2 = pre2?.next
        }
        pre0?.next = list2
        pre2?.next = pre?.next
        return newHead.next
    }
}
// @lc code=end

