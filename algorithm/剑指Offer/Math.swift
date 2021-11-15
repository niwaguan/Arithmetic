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
    
    /// 求：一个整型数组 nums 里除两个数字之外，其他数字都出现了两次。请写程序找出这两个只出现一次的数字(分别记为x,y)。要求时间复杂度是O(n)，空间复杂度是O(1)。
    /// 链接：https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-lcof/submissions/
    /// 特点X：一个数组中只有一个值只出现一次，其他都出现两次时：他们彼此^运算，结果就是这个只出现一次的值。
    /// 基于这个特点，想办法将目标数组分成两部分，每部分都满足X。
    /// 如何将 x,y 分别放置在不同组？
    /// 取 x^y 的结果 r, 将r表示为二进制, 取其中值为1的一位，记为第i位，区分出x,y 。x二进制的第i位和y的第i位一定是不同的，若相同就不会在第i为取出1.
    static func singleNumbers(_ nums: [Int]) -> [Int] {
        // 设目标数字为x、y。xy为x^y的结果
        var r = 0
        for num in nums {
            r ^= num
        }
        // 找出区分x，y的mask
        // 因为x != y，xy的二进制位中必定有1的存在；若所有二进制位都是0，则x==y
        var mask = 1
        // 一定为 == 0 不能为 != 1; & 运算的结构有n种， == 0 的只有一种，!= 1 的有 n - 1种
        while (r & mask) == 0 {
            mask <<= 1
        }
        
        var x = 0, y = 0
        for num in nums {
            if (num & mask) != 0 {
                x ^= num
            } else {
                y ^= num
            }
        }
        
        return [x, y]
    }
}
