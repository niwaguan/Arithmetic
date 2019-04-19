/*
 * @lc app=leetcode.cn id=234 lang=swift
 *
 * [234] 回文链表
 *
 * https://leetcode-cn.com/problems/palindrome-linked-list/description/
 *
 * algorithms
 * Easy (35.96%)
 * Total Accepted:    21K
 * Total Submissions: 58.2K
 * Testcase Example:  '[1,2]'
 *
 * 请判断一个链表是否为回文链表。
 * 
 * 示例 1:
 * 
 * 输入: 1->2
 * 输出: false
 * 
 * 示例 2:
 * 
 * 输入: 1->2->2->1
 * 输出: true
 * 
 * 
 * 进阶：
 * 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？
 * 
 */

// Definition for singly-linked list.

// public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
// }

class Solution {
    
    /// 使用快慢两个指针找到链表中点，慢指针每次前进一步，快指针每次前进两步。
    /// 在快指针到达尽头时，慢指针达到链表中点。因为长度相同慢指针速度减半，自然相同时间路程为一半。
    /// 在慢指针前进时，顺道把前半段链表翻转。此后，前后半段依次比较
    func isPalindrome(_ head: ListNode?) -> Bool {
        
        if head == nil || head?.next == nil {
            return true
        }
        
        var slow: ListNode? = head
        var fast: ListNode? = head
        var pre: ListNode?
        
        while fast?.next != nil {
            // 记录slow的下一步，以免在反转前一部分的时候丢失
            let slowNext = slow?.next
            fast = fast?.next?.next
            
            slow?.next = pre
            pre = slow
            slow = slowNext
        }
        
        // 奇数个节点，循环退出时，fast不为空(fast.next为空)，slow指向是中间节点
        // 中间节点不是后半段链表的起始点，故需要继续前进一个
        if (fast != nil) {
            slow = slow?.next
        }
        
        while slow != nil {
            if (slow?.val != pre?.val) {
                return false
            }
            slow = slow?.next
            pre = pre?.next
        }
        
        return true
    }
}

