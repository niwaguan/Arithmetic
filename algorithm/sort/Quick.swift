//
//  Quick.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/10.
//

import Foundation

class Quick {
    /// 简单版本，多次过滤数组，赛选出小于pivot，等于pivot，大于pivot的子数组，分别将他们继续分隔
    func easy<T>(_ array: [T]) -> [T] where T: Comparable {
        guard array.count > 1 else {
            return array
        }
        let pivot = array[array.count / 2]
        let lesser = array.filter { $0 < pivot }
        let equal = array.filter { $0 == pivot }
        let greater = array.filter { $0 > pivot }
        return easy(lesser) + equal + easy(greater)
    }
    
    @discardableResult
    /// Lomuto分隔方法 [low, hight]
    /// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Quicksort#lomutos-partitioning-scheme
    func partitionLomuto<T: Comparable>(_ array: inout [T], low: Int, high: Int) -> Int {
        let pivot = array[high]
        var i = low
        for j in low..<high {
            if array[j] <= pivot {
                array.swapAt(i, j)
                i += 1
            }
        }
        array.swapAt(i, high)
        return i
    }
    /// ❌ crashed Simultaneous accesses to 0x1053135e0, but modification requires exclusive access.
    func sortByPartitionLomuto<T>(_ array: [T]) -> [T] where T: Comparable {
        var ret = array
        
        func sort(_ array: inout [T], low: Int, high: Int) {
            if low < high {
                let i = partitionLomuto(&ret, low: low, high: high)
                partitionLomuto(&ret, low: low, high: i - 1)
                partitionLomuto(&ret, low: i + 1, high: high)
            }
        }
        
        sort(&ret, low: 0, high: array.count - 1)
        
        return ret
    }
    /// [3, 2, 1, 0]
    func partitionHoare<T: Comparable>(_ array: inout [T], low: Int, high: Int) -> Int {
        let pivot = array[low]
        var i = low - 1
        var j = high + 1

        while true {
          repeat { j -= 1 } while array[j] > pivot
          repeat { i += 1 } while array[i] < pivot

          if i < j {
              array.swapAt(i, j)
          } else {
            return j
          }
        }
    }
    
    func sort<T>(_ array: [T]) -> [T] where T: Comparable {
        var ret = array
        
        /// [from, to]
        func partition(from: Int, to: Int) {
            guard from < to, from >= 0, to < array.count else {
                return
            }
            // 选取基准
            let pivot = ret[from]
            var left = from, right = to
            // 左右相遇时退出
            while left < right {
                /// 第一个小于pivot的
                while left < right, ret[right] >= pivot { right -= 1 }
                /// 第一个大于pivot的
                while left < right, ret[left] <= pivot { left += 1 }
                ret.swapAt(left, right)
            }
            // 此时left == right , 将基准值放在应该在的位置.
            // 该位置的左边，全部是小于基准
            // 该位置的右边，全部大于基准
            ret.swapAt(left, from)
            partition(from: from, to: right - 1)
            partition(from: right + 1, to: to)
        }
        
        partition(from: 0, to: ret.count - 1)
        
        return ret
    }
}
