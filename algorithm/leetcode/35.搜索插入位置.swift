//
//  35.搜索插入位置.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/29.
//

import Foundation

class SearchInsert {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        // 若最后一个数字都小于Target，直接返回
        if nums[nums.count - 1] < target {
            return nums.count
        }
        var low = 0, high = nums.count - 1
        while low < high {
            let pivot = low + (high - low) / 2
            let value = nums[pivot]
            /// value小于插入值时，mid及mid左边的值一定不是目标位置
            if value < target {
                low = pivot + 1
            } else {
                high = pivot
            }
        }
        // while退出时，low == high
        return high
    }
}
