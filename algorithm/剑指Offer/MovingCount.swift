//
//  MovingCount.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/7.
//

import Foundation
// https://leetcode-cn.com/problems/ji-qi-ren-de-yun-dong-fan-wei-lcof/
class MovingCount {
    
    func movingCount(_ rows: Int, _ columns: Int, _ k: Int) -> Int {
        var ret = 0
        var visited = Array(repeating: Array(repeating: 0, count: columns), count: rows)
        
        dfs(row: 0, column: 0, rows: rows, columns: columns, limit: k, ret: &ret, visited: &visited)
        
        return ret
    }
    
    func dfs(row: Int, column: Int, rows: Int, columns: Int, limit: Int, ret: inout Int, visited: inout [[Int]]) {
        if row < 0 || row >= rows || column < 0 || column >= columns || visited[row][column] > 0 {
            return
        }
        
        let sum = self.sum(of: row) + self.sum(of: column)
        if sum > limit {
            return
        }
        ret += 1
        visited[row][column] = 1
        
        dfs(row: row - 1, column: column, rows: rows, columns: columns, limit: limit, ret: &ret, visited: &visited)
        dfs(row: row + 1, column: column, rows: rows, columns: columns, limit: limit, ret: &ret, visited: &visited)
        dfs(row: row, column: column + 1, rows: rows, columns: columns, limit: limit, ret: &ret, visited: &visited)
        dfs(row: row, column: column - 1, rows: rows, columns: columns, limit: limit, ret: &ret, visited: &visited)
    }
    
    func sum(of number: Int) -> Int {
        var ret = 0
        var value = number
        while value > 0 {
            let x = value % 10
            ret += x
            value = value / 10
        }
        return ret
    }
}
