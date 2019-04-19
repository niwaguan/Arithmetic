/*
 * @lc app=leetcode.cn id=7 lang=javascript
 *
 * [7] 整数反转
 *
 * https://leetcode-cn.com/problems/reverse-integer/description/
 *
 * algorithms
 * Easy (32.21%)
 * Total Accepted:    112.1K
 * Total Submissions: 347.9K
 * Testcase Example:  '123'
 *
 * 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
 * 
 * 示例 1:
 * 
 * 输入: 123
 * 输出: 321
 * 
 * 
 * 示例 2:
 * 
 * 输入: -123
 * 输出: -321
 * 
 * 
 * 示例 3:
 * 
 * 输入: 120
 * 输出: 21
 * 
 * 
 * 注意:
 * 
 * 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−2^31,  2^31 − 1]。请根据这个假设，如果反转后整数溢出那么就返回
 * 0。
 * 
 */
/**
 * @param {number} x
 * @return {number}
 */
var reverse = function(x) {

    // 0 
    if (x === 0) {
        return 0
    }

    var initial = Math.abs(x)

    // 1 去除尾部的0
    while (initial !== 0 && initial % 10 === 0) {
        initial /= 10
    }
    
    // 2 通过字符串反转拼接
    var string = initial + ''
    string = string.split('').reverse().join('')

    // 3 符号问题
    var result = Number(string)
    if (x < 0) {
        result  *= -1
    }
    
    // 4 限制问题
    var limitValue = Math.pow(2, 31)
    var limit = {
        up: limitValue - 1,
        bottom: -limitValue
    }

    if (result >= limit.bottom && result <= limit.up) {
        return result;
    }

    return 0
};

