/*
 * @lc app=leetcode.cn id=21 lang=swift
 *
 * [21] 合并两个有序链表
 *
 * https://leetcode-cn.com/problems/merge-two-sorted-lists/description/
 *
 * algorithms
 * Easy (53.84%)
 * Total Accepted:    60.7K
 * Total Submissions: 112.7K
 * Testcase Example:  '[1,2,4]\n[1,3,4]'
 *
 * 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 
 * 
 * 示例：
 * 
 * 输入：1->2->4, 1->3->4
 * 输出：1->1->2->3->4->4
 * 
 * 
 */
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        if (l1 == nil && l2 == nil) { return nil }
        if ((l1 != nil) && l2 == nil) { return l1 }
        if ((l2 != nil) && l1 == nil) { return l2 }
        
        let headerNode = ListNode(0)
        var position: ListNode? = headerNode
        var first = l1, second = l2
        
        while first != nil && second != nil {
            if (first!.val < second!.val) {
                position?.next = first
                first = first!.next
            } else {
                position?.next = second
                second = second!.next
            }
            position = position?.next
        }
        
        if (first != nil) {
            position?.next = first
        }
        
        if (second != nil) {
            position?.next = second
        }
        
        return headerNode.next
    }
}

