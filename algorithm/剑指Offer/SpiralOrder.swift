//
//  SpiralOrder.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/18.
//

import Foundation

class SpiralOrder {
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard matrix.count > 0, matrix[0].count > 0 else {
            return []
        }
        
        var ret = [Int]()
        var top = 0, right = matrix[0].count - 1, bottom = matrix.count - 1, left = 0
        while true {
            // 向右
            for column in left...right {
                ret.append(matrix[top][column])
            }
            // 收缩上边界
            top += 1
            if top > bottom {
                break
            }
            
            // 向下
            for row in top...bottom {
                ret.append(matrix[row][right])
            }
            // 收缩右边界
            right -= 1
            if (left > right) {
                break
            }
            
            // 向左
            for column in (left...right).reversed() {
                ret.append(matrix[bottom][column])
            }
            // 收缩下边界
            bottom -= 1
            if top > bottom {
                break
            }
            
            // 向上
            for row in (top...bottom).reversed() {
                ret.append(matrix[row][left])
            }
            // 收缩左边界
            left += 1
            if left > right {
                break
            }
        }
        
        return ret
    }
}
