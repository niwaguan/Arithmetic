/*
 * @lc app=leetcode.cn id=19 lang=javascript
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
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} head
 * @param {number} n
 * @return {ListNode}
 */
var removeNthFromEnd = function(head, n) {
    /*
    删除目标节点，我们需要知道目标节点的上一个节点，这里用 targetPreNode 表示
    这样，遍历链表的节点 和 targetPreNode 直接的距离就比原来增大了 1 
    */

    var targetPreNode = null, target = null
    var node = head
    var totalSteps = n + 1, step = 0

    while (node) {
        node = node.next
        step ++

        if (step == n) {
            // 找到了目标节点
            target = head
        } else if (step === totalSteps) {
            // 目标节点的前置节点
            target = target.next
            targetPreNode = head
        } else if (step > totalSteps) {
            target = target.next
            targetPreNode = targetPreNode.next
        }
    }

    // 删除的是头节点
    if (target == head) {
        head = head.next
        return head
    }

    // 其他情况
    if (targetPreNode) {
        targetPreNode.next = targetPreNode.next.next
    }

    return head

};

