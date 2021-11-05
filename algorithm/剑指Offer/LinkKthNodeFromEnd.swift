//
//  LinkKthNodeFromEnd.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/4.
//

import Foundation

class LinkKthNodeFromEnd {
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var loop = k
        var fast = head
        var slow = head
        
        while fast != nil {
            fast = fast?.next
            if loop <= 0 {
                slow = slow?.next
            }
            loop -= 1
        }
        
        return slow
    }
}
