//
//  ValidateStackSequences.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/22.
//

import Foundation

/// 模拟栈的push和pop
/// https://leetcode-cn.com/problems/zhan-de-ya-ru-dan-chu-xu-lie-lcof/
class ValidateStackSequences {
    
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        
        var stack: [Int] = []
        var popIndex = 0
        for pushItem in pushed {
            stack.append(pushItem)
            if let top = stack.last, top != popped[popIndex] {
                continue
            }
            while let top = stack.last, popIndex < popped.count, top == popped[popIndex] {
                stack.removeLast()
                popIndex += 1
            }
        }
        
        return popIndex >= popped.count
    }
}
