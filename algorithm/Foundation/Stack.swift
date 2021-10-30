//
//  Stack.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/30.
//

import Foundation

class Stack<T> {
    var items = [T]()
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    var cout: Int {
        return items.count
    }
    
    var top: T? {
        return items.last
    }
    
    func push(_ value: T) {
        items.append(value)
    }
    
    func pop() -> T? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
}

extension Stack: Sequence {
    func makeIterator() -> some IteratorProtocol {
        return IndexingIterator(_elements: items)
    }
}
