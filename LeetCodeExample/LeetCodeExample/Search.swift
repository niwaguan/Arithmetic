//
//  Search.swift
//  LeetCodeExample
//
//  Created by gaoyang on 2019/12/31.
//  Copyright © 2019 Gaoyang. All rights reserved.
//

import Foundation


func binarySearch<T: Comparable>(_ target: T, in list:[T]) -> Int? {
    guard list.count > 0 else { return nil }
    var low: Int = 0, high = list.count - 1
    while low <= high {
        let mid = low + ((high - low) >> 1)
        if list[mid] == target {
            return mid
        } else if (list[mid] > target) {
            high = mid - 1
        } else if (list[mid] < target) {
            low = mid + 1
        }
    }
    
    return nil
}
