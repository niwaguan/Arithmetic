//
//  CQueue.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/25.
//

import Foundation
/// 两个栈实现队列
/// 一个栈left负责入队，一个栈right负责出队
/// 出队时，判断right是否有元素，有的话直接出栈；
/// 没有元素，将left的所有元素出栈并依次入栈到right
class CQueue {

    class Stack {
        var items = [Int]()
        
        var isEmpty: Bool {
            return items.isEmpty
        }
        
        func push(_ item: Int) {
            items.append(item)
        }
        
        func pop() -> Int? {
            guard !items.isEmpty else {
                return nil
            }
            return items.removeLast()
        }
    }
    
    let left = Stack()
    let right = Stack()

    init() {}
    
    func appendTail(_ value: Int) {
        left.push(value)
    }
    
    func deleteHead() -> Int {
        if left.isEmpty && right.isEmpty {
            return -1
        }
        if let x = right.pop() {
            return x
        }
        
        while let x = left.pop() {
            right.push(x)
        }
        
        if let x = right.pop() {
            return x
        }
        
        return -1
    }
}
