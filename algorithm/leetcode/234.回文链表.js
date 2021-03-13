/*
 * @lc app=leetcode.cn id=234 lang=javascript
 *
 * [234] 回文链表
 *
 * https://leetcode-cn.com/problems/palindrome-linked-list/description/
 *
 * algorithms
 * Easy (36.05%)
 * Total Accepted:    21.2K
 * Total Submissions: 58.8K
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
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} head
 * @return {boolean}
 */
var isPalindrome = function(head) {
    
    if (head === null || head.next == null) {
        return true
    }

    var fast = head, slow = head, pre = null

    while (fast && fast.next) {
        fast = fast.next.next

        var next = slow.next
        slow.next = pre
        pre = slow
        slow = next
    }

    if (fast) {
        slow = slow.next
    }

    while (slow) {
        if (slow.val !== pre.val) {
            return false
        }
        slow = slow.next
        pre = pre.next
    }
    return true
};

