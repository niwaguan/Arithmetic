//
//  MaxSubArray.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/2.
//

import Foundation

class MaxSubArray {
    
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        
        // 以元素nums[i]为结尾的连续子数组最大和
        var dp = Array.init(repeating: nums[0], count: nums.count)
        var maxValue = dp[0]
        
        for i in 1..<nums.count {
            let lastMax = dp[i-1]
            if lastMax > 0 {
                dp[i] = lastMax + nums[i]
            } else {
                dp[i] = nums[i]
            }
            if dp[i] > maxValue {
                maxValue = dp[i]
            }
        }
        
        return maxValue
    }
}
