/*
 * @lc app=leetcode.cn id=844 lang=javascript
 *
 * [844] Backspace String Compare
 */
/**
 * @param {string} S
 * @param {string} T
 * @return {boolean}
 */
var backspaceCompare = function(S, T) {
    var sStack = []
    var tStack = []

    S.split('').forEach(element => {
        switch (element) {
            case '#': {
                sStack.pop()
            } break

            default: {
                sStack.push(element)
            } break
        }
    });

    T.split('').forEach(element => {
        
        switch (element) {
            case '#': {
                tStack.pop()
            } break

            default: {
                tStack.push(element)
            } break
        }
    });

    while (sStack.length > 0 && tStack.length > 0) {
        const x = sStack.pop()
        const y = tStack.pop()
        if (x !== y) {
            return false
        }
    }
    return sStack.length <= 0 && tStack.length <= 0
};

