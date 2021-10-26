//
//  ReverseList.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/26.
//

import Foundation

/// 翻转链表
/// 链表的操作一般需要3个节点，当前节点、当前节点的前一个节点、当前节点的后一个节点
class ReverseList {
    
    class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }

    func reverseList(_ head: ListNode?) -> ListNode? {
        
        var pre: ListNode? = nil
        var current = head
        
        while current != nil {
            let next = current?.next
            current?.next = pre
            pre = current
            current = next
        }
        
        return pre
    }
}
