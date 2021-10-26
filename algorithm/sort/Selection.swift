//
//  Selection.swift
//  algorithm
//
//  Created by Gaoyang on 2021/7/20.
//

import Foundation

/// 第一次遍历，找出最小的，放在第一个位置
/// 第二次遍历，找出第二小的，放在第二个位置
/// 第i次遍历，找出第i小的，放在i的位置上
/// 特点：
/// 1. 运行时间和输入无关，只和数组大小有关，因为无论什么数据，需要遍历的次数一致。
/// 2. 数据交换次数最少，每次遍历找到需要交换的后，交换一次
class Selection {
    class func sort<T>(_ array: [T]) -> [T] where T: Comparable {
        debugPrint("-----Selection-----")
        var result = array
        for (i, _) in result.enumerated() {
            var ex = false
            var min = i
            var j = i + 1
            while j < result.count {
                if result[j] < result[min] {
                    min = j
                    ex = true
                }
                j += 1
            }
            if ex {
                result.swapAt(i, min)
            }
        }
        return result
    }
}
