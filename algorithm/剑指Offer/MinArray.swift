//
//  MinArray.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/29.
//

import Foundation

/// [1, 0, 1, 1]
class MinArray {
    func minArray(_ numbers: [Int]) -> Int {
        var low = 0, high = numbers.count - 1
        while low < high {
            let mid = low + (high - low) / 2
            let value = numbers[mid]
            if value > numbers[high] {
                low = mid
            } else if value < numbers[high] {
                high = mid - 1
            }
        }
        return numbers[high]
    }
}
