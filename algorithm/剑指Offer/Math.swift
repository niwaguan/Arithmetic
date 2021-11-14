//
//  Math.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/14.
//

import Foundation

class Math {
    /// 加法
    static func add(_ a: Int, _ b: Int) -> Int {
        var ret = a
        var added = b
        while added != 0 {
            let up = (ret & added) << 1
            ret ^= added
            added = up
        }
        return ret
    }
    
    /// 统计二进制位中1的个数
    static func hammingWeight(_ n: Int) -> Int {
        var x = n
        var ret = 0
        while x > 0 {
            ret += x & 1
            x >>= 1
        }
        return ret
    }
    
    /// 二分计算pow
    static func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        
        if n == 1 {
            return x
        }
        
        
        let xx = n > 0 ? x : 1 / x
        let nn = abs(n)
        
        var ret = myPow(xx, nn / 2)
        ret *= ret
        if n & 1 == 1 {
            ret *= xx
        }
        
        return ret
    }
}
