//
//  Insertion.swift
//  algorithm
//
//  Created by Gaoyang on 2021/7/21.
//

import Foundation

class Insertion {
    class func sort<T: Comparable>(_ array: [T]) -> [T] {
        debugPrint("-----Insertion-----")
        var result = array
        var i = 1
        while i < result.count {
            // 将 result[i] 插入到 result[i -1] result[i -2] result[0]中
            var j = i
            let value = result[i]
            while j > 0 && value < result[j - 1] {
                result[j] = result[j - 1]
                j -= 1
            }
            result[j] = value
            i += 1
        }
        return result
    }
}
