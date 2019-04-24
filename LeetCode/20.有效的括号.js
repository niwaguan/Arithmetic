/*
 * @lc app=leetcode.cn id=20 lang=javascript
 *
 * [20] 有效的括号
 */
/**
 * @param {string} s
 * @return {boolean}
 */
var isValid = function(s) {
    
    const map = new Map()
    map.set(')', '(')
    map.set('}', '{')
    map.set(']', '[')

    const stack = []
    const chars = s.split('')
    
    for(var index = 0; index < chars.length; ++index) {
        var element = chars[index]
        switch (element) {
            case '(':
            case '{':
            case '[': {
                stack.push(element)
            } break;

            case ')':
            case '}':
            case ']': {
                var preElement = stack.pop()
                if (preElement !== map.get(element)) {
                    return false
                }
            } break;
        }
    }

    return stack.length <= 0
};

