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
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rows = matrix.count
        guard let row0 = matrix.first else {
            return false
        }
        let columns = row0.count
        
        var row = 0, colomn = columns - 1
        while row >= 0 && row < rows && colomn >= 0 && colomn < columns {
            let value = matrix[row][colomn]
            if value == target {
                return true
            } else if value < target {
                row += 1
            } else {
                colomn -= 1
            }
        }
        
        return false
    }
}
