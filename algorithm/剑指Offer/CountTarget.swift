//
//  CountTarget.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/28.
//

import Foundation

// https://leetcode-cn.com/problems/zai-pai-xu-shu-zu-zhong-cha-zhao-shu-zi-lcof/
// 先二分查找出现的位置
// 向前向后遍历
class CountTarget {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var index = -1
        
        var low = 0, high = nums.count - 1
        while low <= high {
            let middle = (low + high) / 2
            let x = nums[middle]
            // 找到了，break，并记录索引
            if x == target {
                index = middle
                break
            } else if target < x {
                high = middle - 1
            } else {
                low = middle + 1
            }
        }
        // 没找到，返回0
        if index < 0 {
            return 0
        }
        
        // 找到了，开始统计
        var count = 1
        var i = index - 1
        while i >= 0 && nums[i] == target {
            count += 1
            i -= 1
        }
        
        i = index + 1
        while i < nums.count && nums[i] == target {
            count += 1
            i += 1
        }
        
        return count
    }
}
