/*
 * @lc app=leetcode.cn id=1044 lang=swift
 *
 * [1044] 最长重复子串
 *
 * https://leetcode-cn.com/problems/longest-duplicate-substring/description/
 *
 * algorithms
 * Hard (17.85%)
 * Likes:    35
 * Dislikes: 0
 * Total Accepted:    1.6K
 * Total Submissions: 8.7K
 * Testcase Example:  '"banana"'
 *
 * 给出一个字符串 S，考虑其所有重复子串（S 的连续子串，出现两次或多次，可能会有重叠）。
 * 
 * 返回任何具有最长可能长度的重复子串。（如果 S 不含重复子串，那么答案为 ""。）
 * 
 * 
 * 
 * 示例 1：
 * 
 * 输入："banana"
 * 输出："ana"
 * 
 * 
 * 示例 2：
 * 
 * 输入："abcd"
 * 输出：""
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 2 <= S.length <= 10^5
 * S 由小写英文字母组成。
 * 
 * 
 */
/**
 * 思路: 二分查找缩小查找长度 + Rabin-Karp字符串编码查找
 * 1. 为什么可以使用二分查找确定最终长度?
 *  目标长度一定存在于 0...length-1 的范围中, 假设目标长度为L, 那么一定存在 L-1 也满足条件, 且 L+1一定不满足条件
 */
// @lc code=start
class Solution {
    func longestDupSubstring(_ S: String) -> String {
        binaryLoop(from: 0, to: S.count) { (length) -> Bool in
            return true
        }
        return ""
    }
    
    private func binaryLoop(from: Int = 0, to: Int, task: (Int)->Bool) {
        var left = from, right = to
        while left <= right {
            let mid = left + (right - left) >> 1
            let forward = task(mid)
            if forward {
                left = mid + 1
            }
            else {
                right = mid - 1
            }
        }
    }
}
// @lc code=end

