/*
 * @lc app=leetcode.cn id=9 lang=javascript
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
/**
 * @param {number} x
 * @return {boolean}
 */
var isPalindrome = function(x) {
    // 负数不是回文
    // 最后一位为0的不是回文，第一位不会为0
    if (x < 0 || (x !== 0 && x % 10 === 0)) {
        return false
    }

    // 统计位数
    let count = 0
    var clone = x
    while(clone > 0) {
        count ++
        clone /= 10
    }

    // 一位数字为回文
    if (count === 1) {
        return true
    }

    var front = x, modFront = Math.pow(10, count)
    var back = x, modBack = 10

    while(modFront !== modBack) {
        const x = front / modFront
        const y = back % modBack
        if (x !== y) {
            return false
        }
        front = front - x * modFront
        modFront /= 10
        
        back /= 10
        modBack *= 10
    }

    return true
};
