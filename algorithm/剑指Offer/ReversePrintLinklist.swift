//
//  ReversePrintLinklist.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/26.
//

import Foundation

/// 逆序打印链表
class ReversePrintLinklist {
    class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func reversePrint(_ head: ListNode?) -> [Int] {
        guard head != nil else {
            return []
        }
        
        var items = [Int]()
        var current = head
        while let node = current {
            items.insert(node.val, at: 0)
            current = current?.next
        }
        
        return items
    }
}
