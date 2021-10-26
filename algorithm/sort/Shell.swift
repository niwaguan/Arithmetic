//
//  Shell.swift
//  algorithm
//
//  Created by Gaoyang on 2021/7/27.
//

import Foundation

class Shell {
    class func sort<T: Comparable>(_ x: [T]) -> [T] {
        debugPrint("-----Shell-----")
        var array = x
        var h = 1
        // 确定初始步长
        while h < array.count / 3 {
            h = h * 3 + 1
        }
        // 逐步缩小h值
        while h > 0 {
            // 以步长为h进行插入排序
            var i = h
            while i < array.count {
                let value = array[i]
                var j = i
                while j >= h && value < array[j - h] {
                    array[j] = array[j - h]
                    j -= h
                }
                array[j] = value
                i += 1
            }
            
            h /= 3
        }
        return array
    }
}
