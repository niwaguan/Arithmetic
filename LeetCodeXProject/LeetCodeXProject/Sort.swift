//
//  Sort.swift
//  LeetCodeXProject
//
//  Created by 高洋 on 2019/9/14.
//  Copyright © 2019 Zhibai. All rights reserved.
//

import Foundation

func bubbleSort<T>(_ array: [T]) -> [T] where T: Comparable {
    var results = array
    
    for i in 0..<results.count - 1 {
        var swapped = false
        let up = array.count - i - 1
        for j in 0..<up {
            if (results[j] > results[j + 1]) {
                results.swapAt(j, j + 1)
                swapped = true
            }
        }
        // 一次冒泡后没有元素交换，则排序可提前结束
        if (!swapped) {
            break
        }
    }
    
    return results
}


func insertionSort<T>(_ array: [T]) -> [T] where T: Comparable {
    var result = array
    
    // 第一个元素自己有序，从第二个开始
    for i in 1..<result.count {
        let value = result[i]
        
        var position = i - 1
        while position >= 0 && value < result[position] {
            result[position + 1] = result[position]
            position -= 1
        }
        
        result[position + 1] = value
    }
    
    return result
}

func selectionSort<T>(_ array: [T]) -> [T] where T: Comparable {
    var result = array
    for i in 0..<result.count {
        var position = i
        var j = i + 1
        while j < result.count {
            if result[j] < result[position] {
                position = j
            }
            j += 1
        }
        if (result[position] != result[i]) {
            result.swapAt(position, i)
        }
    }
    return result
}
