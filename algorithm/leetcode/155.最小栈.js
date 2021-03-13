/*
 * @lc app=leetcode.cn id=155 lang=javascript
 *
 * [155] 最小栈
 */
/**
 * initialize your data structure here.
 */
var MinStack = function () {
    this.minStack = []
    this.stack = []
};

/** 
 * @param {number} x
 * @return {void}
 */
MinStack.prototype.push = function (x) {
    this.stack.push(x)
    if (this.minStack.length <= 0 ||
        this.minStack[this.minStack.length - 1] >= x) {
        this.minStack.push(x)
    }
};

/**
 * @return {void}
 */
MinStack.prototype.pop = function () {
    var x = this.stack.pop()
    if (this.minStack.length > 0 &&
        this.minStack[this.minStack.length - 1] === x) {
        this.minStack.pop()
    }
};

/**
 * @return {number}
 */
MinStack.prototype.top = function () {
    return this.stack[this.stack.length - 1]
};

/**
 * @return {number}
 */
MinStack.prototype.getMin = function () {
    return this.minStack[this.minStack.length - 1]
};


