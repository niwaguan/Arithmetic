/*
 * @lc app=leetcode.cn id=367 lang=swift
 *
 * [367] 有效的完全平方数
 */

// @lc code=start
class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        if (num <= 1) { return true }
        
        var isPerfectSquare = false
        var low = 0, high = num/2
        while low <= high {
            let mid = low + ((high - low) >> 1)
            let maybe = mid * mid
            if (maybe > num) {
                high = mid - 1
            } else if (maybe < num) {
                low = mid + 1
            } else {
                isPerfectSquare = true
                break
            }
        }
        
        return isPerfectSquare
    }
}
// @lc code=end

