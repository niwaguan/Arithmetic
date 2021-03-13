/*
 * @lc app=leetcode.cn id=232 lang=javascript
 *
 * [232] 用栈实现队列
 */
/**
 * Initialize your data structure here.
 */
var MyQueue = function() {
    this.pushStack = []
    this.popStack = []
};

/**
 * Push element x to the back of queue. 
 * @param {number} x
 * @return {void}
 */
MyQueue.prototype.push = function(x) {
    this.pushStack.push(x)
};

/**
 * check if the popStack is empty.
 * if `true`, pop the pushStack each element, then push into popStack
 */
MyQueue.prototype.checkPopStack = function() {

    if (this.popStack.length <= 0) {
        while (this.pushStack.length > 0) {
            const x = this.pushStack.pop()
            this.popStack.push(x)
        }
    }
}
/**
 * Removes the element from in front of queue and returns that element.
 * @return {number}
 */
MyQueue.prototype.pop = function() {
    this.checkPopStack()
    return this.popStack.pop()
};

/**
 * Get the front element.
 * @return {number}
 */
MyQueue.prototype.peek = function() {
    this.checkPopStack()
    return this.popStack[this.popStack.length - 1]
};

/**
 * Returns whether the queue is empty.
 * @return {boolean}
 */
MyQueue.prototype.empty = function() {
    return this.pushStack.length <= 0 && this.popStack.length <= 0;
};

/** 
 * Your MyQueue object will be instantiated and called as such:
 * var obj = new MyQueue()
 * obj.push(x)
 * var param_2 = obj.pop()
 * var param_3 = obj.peek()
 * var param_4 = obj.empty()
 */

