//
//  ArrayKthLeastNumbers.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/10.
//

import Foundation

class ArrayKthLeastNumbers {
    
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        var ret = arr
        
        func partition(from: Int, to: Int) -> [Int] {
            var left = from
            var right = to
            while left < right {
                while left < right, ret[right] >= ret[from] { right -= 1 }
                while left < right, ret[left] <= ret[from] { left += 1 }
                ret.swapAt(left, right)
            }
            ret.swapAt(from, left)
            
            if k < left {
                return partition(from: from, to: left - 1)
            }
            if k > left {
                return partition(from: left + 1, to: to)
            }
            return Array(ret[0..<k])
        }
        return partition(from: 0, to: ret.count - 1)
    }
}
