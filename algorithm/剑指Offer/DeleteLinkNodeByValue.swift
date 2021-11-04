//
//  DeleteLinkNodeByValue.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/4.
//

import Foundation

class DeleteLinkNodeByValue {
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        // 指向要删除节点的前一个
        var pre: ListNode? = nil
        // 指向要删除的节点
        var node: ListNode? = head
        
        while node != nil {
            if node!.val == val {
                break
            }
            pre = node
            node = node?.next
        }
        // 删除了第一个节点
        if pre == nil {
            return head.next
        } else {
            // node 指向要删除的节点
            pre!.next = node?.next
        }
        
        return head
    }
}
