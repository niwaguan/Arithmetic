/*
 * @lc app=leetcode.cn id=7 lang=swift
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
class Solution {
    func reverse(_ x: Int) -> Int {
        // 0
        guard x != 0 else {
            return 0
        }
        
        // 原数据，结果，每一位数字
        var source = x, result = 0, item = 0
        
        // 去除尾部0
        while source != 0 && source % 10 == 0 {
            source /= 10
        }
        
        // 从最低一位开始循环取得每一位数字
        // 为 0，则放弃
        // 将结果累加到result中
        while source != 0 {
            item = source % 10
            source /= 10
            result = result * 10 + item
        }

        if (result > Int32.max || result < Int32.min) {
            return 0
        }
        
        return result
    }
}

