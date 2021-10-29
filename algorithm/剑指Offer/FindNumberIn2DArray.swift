//
//  FindNumberIn2DArray.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/29.
//

import Foundation

// https://leetcode-cn.com/problems/er-wei-shu-zu-zhong-de-cha-zhao-lcof/
/**
 [
 [1,   4,  7, 11, 15],
 [2,   5,  8, 12, 19],
 [3,   6,  9, 16, 22],
 [10, 13, 14, 17, 24],
 [18, 21, 23, 26, 30]
 ]
 */
class FindNumberIn2DArray {
    struct Index {
        let line: Int
        let column: Int
    }
    
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        func search(_ array: inout [[Int]], low: Index, up: Index) -> Bool {
            if low.line <= up.line && low.column <= up.column {
                let middle = Index(line: (low.line + up.line) / 2, column: (low.column + up.column) / 2)
                // 交叉搜索
                for i in low.column...up.column {
                    let value = array[middle.line][i]
                    if value == target {
                        return true
                    }
                }
                
                for i in low.line...up.line {
                    let value = array[i][middle.column]
                    if value == target {
                        return true
                    }
                }
                
                var ret = false
                let value = matrix[middle.line][middle.column]
                let topLeft = (low: low, up: Index(line: middle.line - 1, column: middle.column - 1))
                let topRight = (low: Index(line: low.line, column: middle.column + 1), up: Index(line: middle.line - 1, column: up.column))
                let bottomLeft = (low: Index(line: middle.line + 1, column: low.column), up: Index(line: up.line, column: middle.column - 1))
                let bottomRight = (low: Index(line: middle.line + 1, column: middle.column + 1), up: up)
                
                // 被middle分隔的四个角落
                ret = search(&array, low: topRight.low, up: topRight.up)
                if ret {
                    return true
                }
                
                ret = search(&array, low: bottomLeft.low, up: bottomLeft.up)
                if ret {
                    return true
                }
                
                if value < target {
                    ret = search(&array, low: bottomRight.low, up: bottomRight.up)
                } else {
                    ret = search(&array, low: topLeft.low, up: topLeft.up)
                }
                return ret
            }
            return false
        }
        
        let lines = matrix.count
        guard let line = matrix.first else {
            return false
        }
        let columns = line.count
        var values = matrix
        
        return search(&values, low: Index(line: 0, column: 0), up: Index(line: lines - 1, column: columns - 1))
    }
}
