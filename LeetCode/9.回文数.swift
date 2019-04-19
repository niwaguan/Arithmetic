/*
 * @lc app=leetcode.cn id=9 lang=swift
 *
 * [9] 回文数
 *
 * https://leetcode-cn.com/problems/palindrome-number/description/
 *
 * algorithms
 * Easy (55.85%)
 * Total Accepted:    97.6K
 * Total Submissions: 174.7K
 * Testcase Example:  '121'
 *
 * 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
 * 
 * 示例 1:
 * 
 * 输入: 121
 * 输出: true
 * 
 * 
 * 示例 2:
 * 
 * 输入: -121
 * 输出: false
 * 解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 * 
 * 
 * 示例 3:
 * 
 * 输入: 10
 * 输出: false
 * 解释: 从右向左读, 为 01 。因此它不是一个回文数。
 * 
 * 
 * 进阶:
 * 
 * 你能不将整数转为字符串来解决这个问题吗？
 * 
 */
class Solution {
    /**
     
     将数字本身反转，然后将反转后的数字与原始数字进行比较，如果它们是相同的，那么这个数字就是回文。 但是，如果反转后的数字大于
     int.MAX，我们将遇到整数溢出问题。
     
     按照这个想法，为了避免数字反转可能导致的溢出问题，为什么不考虑只反转 int 数字的一半？
     毕竟，如果该数字是回文，其后半部分反转后应该与原始数字的前半部分相同。
     
     例如，输入 1221，我们可以将数字“1221”的后半部分从“21”反转为“12”，并将其与前半部分“12”进行比较，因为二者相同，我们得知数字 1221 是回文。
     
     如何知道已经反转了一半？反转的数字大于正序的数字。
     
     */
    func isPalindrome(_ x: Int) -> Bool {
        // 负数不是回文
        // 能被10整除的不是回文（0除外）
        if (x < 0 || (x % 10 == 0 && x != 0)) {
            return false
        }
        
        var initial = x // Swift中形参是不能修改的
        var reversed = 0
        while (reversed < initial) {
            let item = initial % 10
            reversed = reversed * 10 + item
            initial /= 10
        }
        
        // while退出时，initial == reversed 或 reversed > initial
        // 在 reversed > initial 时 reversed 的计算可能多循环一次 如 21
        
        return initial == reversed || initial == reversed / 10
    }
}

