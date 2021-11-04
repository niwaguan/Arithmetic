//
//  ListNode.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/4.
//

import Foundation
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    static func buildList(_ values: [Int]?) -> ListNode? {
        guard let values = values else {
            return nil
        }

        let head = ListNode(0)
        var node = head
        for value in values {
            let n = ListNode(value)
            node.next = n
            node = n
        }
        return head.next
    }
    
    func printList() {
        var values = [Int]()
        var node: ListNode? = self
        while node != nil {
            values.append(node!.val)
            node = node?.next
        }
        print(values)
    }
}
