/*
 * @lc app=leetcode.cn id=19 lang=swift
 *
 * [19] 删除链表的倒数第N个节点
 *
 * https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/description/
 *
 * algorithms
 * Medium (33.19%)
 * Total Accepted:    40.1K
 * Total Submissions: 120.9K
 * Testcase Example:  '[1,2,3,4,5]\n2'
 *
 * 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。
 * 
 * 示例：
 * 
 * 给定一个链表: 1->2->3->4->5, 和 n = 2.
 * 
 * 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 * 
 * 
 * 说明：
 * 
 * 给定的 n 保证是有效的。
 * 
 * 进阶：
 * 
 * 你能尝试使用一趟扫描实现吗？
 * 
 */

// Definition for singly-linked list.

//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
//}

class Solution {
    
    // TODO: 打开上面的 ListNode 类定义即可编译成功
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        var step = n
        var node = head
        
        while step > 0 && node != nil {
            step -= 1
            node = node?.next
        }
        
        var preTarget: ListNode? = {
            let node = ListNode(0)
            node.next = head
            return node
        }()
        let resolvedHead = preTarget
        
        while node != nil {
            node = node?.next
            preTarget = preTarget?.next
        }
        
        preTarget?.next = preTarget?.next?.next
        
        return resolvedHead?.next
    }
}

