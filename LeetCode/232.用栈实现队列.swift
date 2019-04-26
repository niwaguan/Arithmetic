/*
 * @lc app=leetcode.cn id=232 lang=swift
 *
 * [232] 用栈实现队列
 */

class MyQueue {

    private var pushStack: [Int] = []
    private var popStack: [Int] = []
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    private func checkPopStack() {
        if (popStack.isEmpty) {
            while pushStack.isEmpty == false {
                let x = pushStack.removeLast()
                popStack.append(x)
            }
        }
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        pushStack.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        checkPopStack()
        return popStack.removeLast()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        checkPopStack()
        return popStack.last ?? 0
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return popStack.isEmpty && pushStack.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */

