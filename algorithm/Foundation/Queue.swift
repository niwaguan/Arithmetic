//
//  Queue.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/30.
//

import Foundation

class Queue<T> {
    var left = Stack<T>()
    var right = Stack<T>()
    
    func enqueue(_ value: T) {
        left.push(value)
    }
    
    func dequeue() -> T? {
        if right.isNotEmpty {
            return right.pop()
        }
        if left.isNotEmpty {
            while left.isNotEmpty {
                right.push(left.pop()!)
            }
            return right.pop()
        }
        return nil
    }
}
