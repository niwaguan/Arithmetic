//
//  DiningPhilosophers.swift
//  LeetCodeExample
//
//  Created by gaoyang on 2020/1/10.
//  Copyright © 2020 Gaoyang. All rights reserved.
//
// 哲学家进餐问题
// 参考wiki服务生解法： https://zh.wikipedia.org/wiki/%E5%93%B2%E5%AD%A6%E5%AE%B6%E5%B0%B1%E9%A4%90%E9%97%AE%E9%A2%98

import Foundation


enum PhilosopherStatus {
    case thinking, eating
}

class Server {
    var count: Int = 0
    var status = [Int: PhilosopherStatus]()
    let mutext = DispatchSemaphore(value: 1)
    init(count: Int) {
        self.count = count
        for i in 0..<count {
            status[i] = .thinking
        }
    }
    
    func canEating(at index: Int) -> Bool {
        guard index < status.count else {
            return false
        }
        let left = (index - 1 + count) % count
        let right = (index + 1) % count
        
        if let s = status[index], s == .thinking,
            let ls = status[left], ls != .eating,
            let rs = status[right], rs != .eating {
            status[index] = .eating
            return true
        }
        
        return false
    }
    
    func canEndEating(at index: Int) -> Bool {
        if let s = status[index], s == .eating {
            status[index] = .thinking
            return true
        }
        return false
    }
}

let count = 5

class DiningPhilosopher {
    let server = Server(count: count)
    let mutext = DispatchSemaphore(value: 1)
    
    func perform() {
        for index in 0..<count {
            Thread.detachNewThread {
                self.doHisWork(index)
            }
        }
    }
    
    func doHisWork(_ index: Int) {
        guard index < count else {
            return;
        }
        
        while true {
            thinking(index: index)
            mutext.wait()
            if server.canEating(at: index) {
                eating(index: index)
            }
            mutext.signal()
            
            mutext.wait()
            if server.canEndEating(at: index) {
                thinking(index: index)
            }
            mutext.signal()
        }
    }
    
    func thinking(index: Int) {
        print("🙇‍♂️\(index) thinking. ")
    }
    
    func eating(index: Int) {
        print("🍽\(index) eating. ")
    }
}
