/*
 * @lc app=leetcode.cn id=69 lang=swift
 *
 * [69] x 的平方根
 */

// @lc code=start
class Solution {
    func mySqrt(_ x: Int) -> Int {
        if (x == 0) { return 0 }
        if (x == 1) { return 1 }
        var low = 1, high = x/2
        while low <= high {
            let mid = low + ((high - low) >> 1)
            let maybe = mid * mid, assist = (mid + 1) * (mid + 1)
            if (maybe == x || (maybe < x && assist > x)) {
                return mid
            }
            
            if maybe > x {
                high = mid - 1
            } else if maybe < x {
                low = mid + 1
            }
        }
        return 0
    }
}
// @lc code=end

