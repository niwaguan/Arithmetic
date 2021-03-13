/*
 * @lc app=leetcode.cn id=155 lang=swift
 *
 * [155] 最小栈
 */

class MinStack {

    private var content: [Int] = []
    private var minStack: [Int] = []
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        content.append(x)
        if let last = minStack.last {
            if (x <= last) {
                minStack.append(x)
            }
        } else {
            minStack.append(x)
        }
    }
    
    func pop() {
        let x = content.removeLast()
        if let last = minStack.last, last == x {
            minStack.removeLast()
        }
    }
    
    func top() -> Int {
        return content.last ?? 0
    }
    
    func getMin() -> Int {
        return minStack.last ?? 0
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

