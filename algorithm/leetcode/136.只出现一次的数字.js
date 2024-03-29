/*
 * @lc app=leetcode.cn id=136 lang=javascript
 *
 * [136] 只出现一次的数字
 *
 * https://leetcode-cn.com/problems/single-number/description/
 *
 * algorithms
 * Easy (71.65%)
 * Likes:    1918
 * Dislikes: 0
 * Total Accepted:    434.9K
 * Total Submissions: 606.9K
 * Testcase Example:  '[2,2,1]'
 *
 * 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
 * 
 * 说明：
 * 
 * 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
 * 
 * 示例 1:
 * 
 * 输入: [2,2,1]
 * 输出: 1
 * 
 * 
 * 示例 2:
 * 
 * 输入: [4,1,2,1,2]
 * 输出: 4
 * 
 */

// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var singleNumber = function(nums) {
  let filter = []
  for (let i = 0; i < nums.length; ++i) {
    let handled = false
    for (let j = 0; j < filter.length; ++j) {
      if (nums[i] === filter[j]) {
        filter.splice(j, 1)
        handled = true
        break
      }
    }
    if (!handled) {
      filter.push(nums[i])
    }
  }
  return filter[0]
};
// @lc code=end