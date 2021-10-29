//
//  MissingNumber.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/28.
//

import Foundation

/// https://leetcode-cn.com/problems/que-shi-de-shu-zi-lcof/submissions/
/// [0,1,3] -> 2 (n=4, 满配[0,1,2,3])
/// [0,1,2,3,4,5,6,7,9] -> 8
/// [0,1] -> 2 (n=3, 满配[0,1,2])
/// [0] -> 1 (n=2, 满配[0,1])
class MissingNumber {
    func missingNumber(_ nums: [Int]) -> Int {
        for i in 0..<nums.count {
            if nums[i] != i {
                return i
            }
        }
        // 所有位置都对上了，只可能缺少最后一个
        return nums.count
    }
}
