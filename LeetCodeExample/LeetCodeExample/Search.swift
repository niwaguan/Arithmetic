//
//  Search.swift
//  LeetCodeExample
//
//  Created by gaoyang on 2019/12/31.
//  Copyright © 2019 Gaoyang. All rights reserved.
//

import Foundation

/// 简单二分搜索
/// 搜索目标数组无重复，只需查找到给定值即可
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

/// 目标数组中存在重复的值，查找第一个等于target的值
func binarySearch<T: Comparable>(first target: T, in list: [T]) -> Int? {
    guard list.count > 0 else { return nil }
    var low = 0, high = list.count - 1
    while low <= high {
        let mid = low + ((high - low) >> 1)
        if (list[mid] > target) {
            high = mid - 1
        } else if (list[mid] < target) {
            low = mid + 1
        } else {
            if (mid == 0 || list[mid - 1] != target) {
                return mid
            } else {
                high = mid - 1
            }
        }
    }
    return nil
}

/// 查找最后一个满足目标的值
func binarySearch<T: Comparable>(last target: T, in list: [T]) -> Int? {
    guard list.count > 0 else { return nil }
    var low = 0, high = list.count - 1
    while low <= high {
        let mid = low + ((high - low) >> 1)
        if (list[mid] > target) {
            high = mid - 1
        } else if (list[mid] < target) {
            low = mid + 1
        } else {
            if (mid == list.count - 1 || list[mid + 1] != target) {
                return mid
            } else {
                low = mid + 1
            }
        }
    }
    return nil
}

/// 查找第一个大于等于target的值
func binarySearch<T: Comparable>(firstBigOrEqual target: T, in list: [T]) -> Int? {
    guard list.count > 0 else {
        return nil
    }
    var low = 0, high = list.count - 1
    while low <= high {
        let mid = low + ((high - low) >> 1)
        if (list[mid] < target) {
            low = mid + 1
        } else {
            if (mid == 0 || list[mid - 1] < target) {
                return mid
            } else {
                high = mid - 1
            }
        }
    }
    return nil
}

/// 查找最后一个小于或等于target的值
func binarySearch<T: Comparable>(lastLessOrEqual target: T, in list: [T]) -> Int? {
    guard list.count > 0 else { return nil }
    var low = 0, high = list.count - 1
    while low <= high {
        let mid = low + ((high - low) >> 1)
        if (list[mid] > target) {
            high = mid - 1
        } else {
            if (mid == list.count - 1 || list[mid + 1] > target) {
                return mid
            } else {
                 low = mid + 1
            }
        }
    }
    return nil
}
