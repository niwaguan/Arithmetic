/*
 * @lc app=leetcode.cn id=322 lang=javascript
 *
 * [322] 零钱兑换
 *
 * https://leetcode-cn.com/problems/coin-change/description/
 *
 * algorithms
 * Medium (42.70%)
 * Likes:    1089
 * Dislikes: 0
 * Total Accepted:    187.2K
 * Total Submissions: 438.3K
 * Testcase Example:  '[1,2,5]\n11'
 *
 * 给定不同面额的硬币 coins 和一个总金额
 * amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。
 * 
 * 你可以认为每种硬币的数量是无限的。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 
 * 输入：coins = [1, 2, 5], amount = 11
 * 输出：3 
 * 解释：11 = 5 + 5 + 1
 * 
 * 示例 2：
 * 
 * 
 * 输入：coins = [2], amount = 3
 * 输出：-1
 * 
 * 示例 3：
 * 
 * 
 * 输入：coins = [1], amount = 0
 * 输出：0
 * 
 * 
 * 示例 4：
 * 
 * 
 * 输入：coins = [1], amount = 1
 * 输出：1
 * 
 * 
 * 示例 5：
 * 
 * 
 * 输入：coins = [1], amount = 2
 * 输出：2
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 1 
 * 1 
 * 0 
 * 
 * 
 */

// @lc code=start
/**
 * @param {number[]} coins
 * @param {number} amount
 * @return {number}
 */
var coinChange = function(coins, amount) {
  const mem = {}
  const dp = (n) => {
    // 递归出口，base case
    if (n < 0) {
      return -1
    }
    if (n === 0) {
      return 0
    }
    // 备忘录查找，存在结果直接返回
    if (mem[n]) {
      return mem[n]
    }
    let res = Number.MAX_SAFE_INTEGER
    for (let index = 0; index < coins.length; index++) {
      const coin = coins[index];
      // 子问题
      const submount = n - coin
      const subres = dp(submount)
      mem[submount] = subres
      if (subres !== -1) {
        res = Math.min(res, subres + 1)
      }
    }
    res = res === -1 || res === Number.MAX_SAFE_INTEGER ? -1 : res
    mem[n] = res
    return res
  }
  return dp(amount)
};
// @lc code=end

