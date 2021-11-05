//
//  MergeTwoLists.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/5.
//

import Foundation

class MergeTwoLists {
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head = ListNode(0)
        var node: ListNode? = head
        var p1 = l1, p2 = l2
        while p1 != nil && p2 != nil {
            let p1v = p1!.val, p2v = p2!.val
            if p1v < p2v {
                node?.next = p1
                p1 = p1?.next
            }
            else {
                node?.next = p2
                p2 = p2?.next
            }
            node = node?.next
        }
        
        if p1 != nil {
            node?.next = p1
        } else if p2 != nil {
            node?.next = p2
        }
        
        return head.next
    }
}
