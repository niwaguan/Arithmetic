//
//  ReaderWriter.swift
//  LeetCodeExample
//
//  Created by gaoyang on 2020/1/11.
//  Copyright © 2020 Gaoyang. All rights reserved.
//
// 读者写者问题

import Foundation

class ReaderWriter {
    var readers = 0
    let reader_mutex = DispatchSemaphore(value: 1)
    let data_mutxt = DispatchSemaphore(value: 1)
    
    func perform() {
        Thread.detachNewThread {
            self.reader()
        }
        
        Thread.detachNewThread {
            self.reader()
        }
        
        Thread.detachNewThread {
            self.writer()
        }
    }
    
    func reader() {
        while true {
            reader_mutex.wait()
            readers += 1
            if (readers == 1) {
                data_mutxt.wait()
            }
            reader_mutex.signal()
            
            print("doing reader")
            
            reader_mutex.wait()
            readers -= 1
            if (readers == 0) {
                data_mutxt.signal()
            }
            reader_mutex.signal()
        }
    }
    
    func writer() {
        while true {
            data_mutxt.wait()
            
            print("doing writer")
            
            data_mutxt.signal()
        }
    }
}


class GCDReaderWriter {
    let queue = DispatchQueue(label: "readerwriter", qos: .default, attributes: [.concurrent], autoreleaseFrequency: .workItem, target: nil)
    
    func reader() -> Int {
        var i: Int!
        queue.sync {
            i = 0
        }
        return i
    }
    
    func writer() {
        let item = DispatchWorkItem(qos: .default, flags: .barrier) {
            // do write
        }
        queue.async(execute: item)
        // or
        //queue.sync(execute: item)
    }
}
