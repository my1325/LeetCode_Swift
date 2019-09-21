//
//  main.swift
//  23.合并k个有序链表
//
//  Created by 超神—mayong on 2019/9/20.
//  Copyright © 2019 超神—mayong. All rights reserved.
//

import Foundation

 public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func createListNodes(_ values: [[Int]]) -> [ListNode?] {
    return values.map({ valueList in
        let head = ListNode(0)
        var cur: ListNode? = head
        for value in valueList {
            let node = ListNode(value)
            cur?.next = node
            cur = cur?.next
        }
        return head.next
    })
}

print("Hello, World!")
