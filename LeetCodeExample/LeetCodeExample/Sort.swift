//
//  Sort.swift
//  LeetCodeXProject
//
//  Created by 高洋 on 2019/9/14.
//  Copyright © 2019 Zhibai. All rights reserved.
//

import Foundation

/// 冒泡排序
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

/// 插入排序
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

/// 选择排序
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

/// 归并排序
func mergeSort<T>(_ array: [T]) -> [T] where T: Comparable {
    
    func merge<T>(_ array: inout [T], from: Int, to: Int, b1: Int, e1: Int, b2: Int, e2: Int) where T: Comparable {
        var i = b1, j = b2
        var temp = [T]()
        while i <= e1 && j <= e2  {
            if array[i] < array[j] {
                temp.append(array[i])
                i += 1
            } else {
                temp.append(array[j])
                j += 1
            }
        }
        
        while i <= e1 {
            temp.append(array[i])
            i += 1
        }
        while j <= e2 {
            temp.append(array[j])
            j += 1
        }
        
        i = from
        j = 0
        while j < temp.count {
            array[i] = temp[j]
            i += 1
            j += 1
        }
    }
    
    func sort<T>(_ array: inout [T], from: Int, to: Int) where T: Comparable {
        if from >= to {
            return
        }
        let middle = (from + to) / 2
        let segment = middle + 1
        sort(&array, from: from, to: middle)
        sort(&array, from: segment, to: to)
        merge(&array, from: from, to: to, b1: from, e1: middle, b2: segment, e2: to)
    }
    
    var result = array
    sort(&result, from: 0, to: result.count - 1)
    return result
}

func countingSort(_ array: [Int]) -> [Int] {
    if (array.count <= 1) { return array }
    // 查找最大值，以确定桶个数
    let maxNum = array.reduce(Int.min) { max($0, $1) }
    
    // 申请桶
    var counting = Array(repeating: 0, count: maxNum + 1)
    
    // 计数
    for item in array {
        counting[item] += 1
    }
    
    // 累加
    for i in 1..<counting.count {
        counting[i] = counting[i-1] + counting[i]
    }
    
    // 排序
    var result = Array(repeating: 0, count: array.count)
    for item in array.reversed() {
        // 根据计数数组确定位置
        let index = counting[item] - 1;
        result[index] = item
        counting[item] -= 1
    }
    
    return result
}
