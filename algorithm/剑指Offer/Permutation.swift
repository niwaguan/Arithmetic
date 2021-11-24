//
//  Permutation.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/23.
//

import Foundation
/// 字符串的排列
/// https://leetcode-cn.com/problems/zi-fu-chuan-de-pai-lie-lcof/
class Permutation {
    
    func permutation(_ s: String) -> [String] {
        
        var chars = Array(s)
        var ret: [String] = []
        
        // 0. 一个序列，可以从固定第0位/第1位/第x位入手。固定第i位可以在原序列中进行
        func backtracking(for fixed: Int) {
            // 2. 到固定最后一位结束
            if fixed == chars.count - 1 {
                ret.append(String(chars))
                return
            }
            // 3. 在宽度上剪枝，第i位上已经使用的
            var used = Set<Character>()
            for i in fixed..<chars.count {
                if used.contains(chars[i]) {
                    continue
                }
                used.insert(chars[i])
                
                chars.swapAt(fixed, i)
                backtracking(for: fixed + 1)
                chars.swapAt(fixed, i)
                
            }
        }
        // 1. 从固定第0位开始
        backtracking(for: 0)
        
        return ret
    }
}
