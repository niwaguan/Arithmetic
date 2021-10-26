//
//  MinStack.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/25.
//

import Foundation

/// 带有实时查看最小元素的栈。要求入栈出栈以及查看最小元素复杂度O(1)
/// 使用辅助栈，记录当前主栈的最小元素。
/// 入栈时，在辅助栈添加最小的；出栈时将辅助栈也出栈一个元素
class MinStack {
    
    var items = [Int]()
    /// 保存最小值的栈
    var mins = [Int]()
    init() {
        
    }
    
    func push(_ x: Int) {
        items.append(x)
        if let min = mins.last {
            mins.append(min < x ? min : x)
        } else {
            mins.append(x)
        }
    }
    
    func pop() {
        if !items.isEmpty {
            items.removeLast()
            mins.removeLast()
        }
    }
    
    func top() -> Int {
        return items.last!
    }
    
    func min() -> Int {
        return mins.last!
    }
}
