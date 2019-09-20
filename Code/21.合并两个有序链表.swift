/*
 * @lc app=leetcode.cn id=21 lang=swift
 *
 * [21] 合并两个有序链表
 */
//Definition for singly-linked list.
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }

class Solution {
    
    /// 最直接的方法，通过数组来排序
    func mergeTwoLists1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var array: [ListNode] = []
        var temL1: ListNode? = l1
        var teml2: ListNode? = l2
        while temL1 != nil || teml2 != nil {
            if let node = temL1 {
                array.append(node)
            }
            
            if let node = teml2 {
                array.append(node)
            }
            temL1 = temL1?.next
            teml2 = teml2?.next
        }
        
        array.sort(by: { $0.val - $1.val < 0 })
        temL1 = ListNode(0)
        teml2 = temL1
        for index in 0 ..< array.count {
            teml2?.next = array[index]
            teml2 = teml2?.next
        }
        return temL1?.next
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
}

