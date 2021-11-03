//
//  GiftMaxValue.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/3.
//

import Foundation

// https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof/solution/
// dp[row][column] 表示以grid[row][column]结尾时的最大值
// dp[0][0] = grid[0][0]
// dp[row][colomn] = max(dp[row-1][column], dp[row][column-1]) + grid[row][column]
class GiftMaxValue {
    /**
    [
      [1,3,1],
      [1,5,1],
      [4,2,1]
    ]
     */
    func maxValue(_ grid: [[Int]]) -> Int {
        var ret = 0
        
        let rows = grid.count
        let columns = grid[0].count
        
        var dp = Array(repeating: Array(repeating: 0, count: columns), count: rows)
        for row in 0..<rows {
            for column in 0..<columns {
                let value = grid[row][column]
                if row == 0 && column == 0 {
                    dp[row][column] = value
                } else {
                    var topMax = -1
                    let top = row - 1
                    if top >= 0 {
                        topMax = dp[top][column]
                    }
                    
                    var leftMax = -1
                    let left = column - 1
                    if left >= 0 {
                        leftMax = dp[row][left]
                    }
                    
                    dp[row][column] = max(topMax, leftMax) + grid[row][column]
                    
                }
                if dp[row][column] > ret {
                    ret = dp[row][column]
                }
            }
        }
        
        return ret
    }
}
