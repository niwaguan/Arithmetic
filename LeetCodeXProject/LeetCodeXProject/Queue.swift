//
//  Queue.swift
//  LeetCodeXProject
//
//  Created by 高洋 on 2019/9/13.
//  Copyright © 2019 Zhibai. All rights reserved.
//

import Foundation

protocol Queue {
    associatedtype ElementType
    
    var isEmpty: Bool { get }
    
    var isFull: Bool { get }
    
    var capability: Int { get }
    
    func enqueue(_ element: ElementType) -> Bool
    
    func dequeue() -> ElementType?
}

class ArrayQueue<Element>: Queue {
    
    // MARK: - protocol Queue
    
    typealias ElementType = Element
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var isFull: Bool {
        return size == capability
    }
    
    var capability: Int
    
    
    /// put an element into the queue
    ///
    /// - Parameter element: the element should be enqueue
    /// - Returns: true if the operation is success, otherwise false
    func enqueue(_ element: Element) -> Bool {
        guard !isFull else {
            return false
        }
        
        lockExecute {
            if trail >= elements.count {
                elements.append(element)
            } else {
                elements[trail] = element
            }
            trail = trail.advanced(by: 1) % capability
            size = size.advanced(by: 1)
        }
        
        return true
    }
    
    func dequeue() -> Element? {
        guard !isEmpty else {
            return nil
        }
        
        var element: Element!
        lockExecute {
            element = elements[head]
            head = head.advanced(by: 1) % capability
            size = size.advanced(by: -1)
        }
        
        return element
    }
    
    // MARK: - implementation
    
    private var elements: [ElementType]
    /// current queue element count
    private var size: Int = 0
    /// the position of header
    private var head: Int = 0
    /// the position of trail
    private var trail: Int = 0
    
    private var lock = NSLock()
    func lockExecute(_ task: () -> Void) {
        lock.lock()
        task()
        lock.unlock()
    }
    
    init(_ capability: Int) {
        self.capability = capability
        self.elements = NSMutableArray(capacity: capability) as! Array<Element>
    }
    
}

extension ArrayQueue: CustomStringConvertible {
    var description: String {
        var string = ""
        for i in 0..<size {
            let index = (i + head) % capability
            let element = elements[index]
            if string.count > 0 {
                string = "\(string),\(element)"
            } else {
                string = "\(element)"
            }
        }
        return string
    }
}

extension ArrayQueue {
    var acutalElements: String {
        return elements.map({ "\($0)" }).joined(separator: ",")
    }
}
