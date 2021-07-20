//
//  Link.swift
//  algorithm
//
//  Created by Gaoyang on 2021/3/26.
//

import Foundation

fileprivate class Node<T :CustomDebugStringConvertible> {
    var next: Node?
    var value: T?
}


class Link<T :CustomDebugStringConvertible> {
    fileprivate var header: Node<T>
    fileprivate var trail: Node<T>?
    init() {
        header = Node<T>()
    }
    // 头插法
    func insert(value: T) {
        let old = header.next
        
        let node = Node<T>()
        node.value = value
        header.next = node
        
        node.next = old
    }
    
    // 尾插发
    func append(value: T) {
        let node = Node<T>()
        node.value = value
        
        
    }
    
}


extension Link: CustomDebugStringConvertible {
    var debugDescription: String {
        var string = ""
        var node = header.next
        while node != nil {
            string = "\(string) -> \(String(describing: node!.value))"
            node = node!.next
        }
        return string
    }
}
