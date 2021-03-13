/*
 * @lc app=leetcode.cn id=21 lang=javascript
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
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var mergeTwoLists = function(l1, l2) {
    let headerNode = { next: null }
    let point = headerNode

    let first = l1, second = l2

    while (first && second) {
        if (first.val < second.val) {
            point.next = first
            first = first.next
        } else {
            point.next = second
            second = second.next
        }
        point = point.next
    }

    // while结束时只有一个链表不为空
    // 根据JS中 || 运算的特点可以简写
    point.next = first || second

    return headerNode.next
};

