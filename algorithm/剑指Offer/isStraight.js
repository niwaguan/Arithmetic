// https://leetcode-cn.com/problems/bu-ke-pai-zhong-de-shun-zi-lcof/
var isStraight = function (nums) {
  nums.sort((a, b) => a - b);
  let set = new Set();
  let count0 = 0;
  let diffs = 0;
  for (let i = 0; i < 5; ++i) {
    let num = nums[i];
    if (num !== 0 && set.has(num)) {
      return false;
    }
    set.add(num);

    if (num === 0) {
      count0 += 1;
    }

    if (i > 0) {
      let pre = nums[i - 1];
      if (num !== 0 && pre !== 0) {
        diffs += num - pre - 1;
      }
    }
  }
  return count0 >= diffs;
};
