//
//  TranslateNum.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/3.
//

import Foundation
// https://leetcode-cn.com/problems/ba-shu-zi-fan-yi-cheng-zi-fu-chuan-lcof/submissions/
// dp[0] 表示空字符串
// dp[1] 表示以第一个字符结尾可能的数量，字符索引 0
// dp[2] 表示以第二个字符结尾可能的数量，字符索引 1
// dp[i] 表示以第i个字符结尾可能的数量，字符索引 i-1
// 每增加一位数字x，造成的结果：
// 1. 单独翻译x，此时和dp[i-1]的结果一样
// 2. x和之前的一位数字组y合成yx，若yx>=10 && yx <=25，可以被翻译，则  dp[i] = dp[i-1] + dp[i-2]
//  因为，剩余两个数字，可以单独翻译x，对应dp[i-1];也可以翻译yx,对应dp[i-2]
class TranslateNum {
    
    func translateNum(_ num: Int) -> Int {
        if num < 10 {
            return 1
        }
        let string = "\(num)"
        var ret = 1
        // 分别代表dp[i-1]/dp[i-2]
        var dpx = 1, dpxx = 1
        for i in 2...string.count {
            var dpi = 0
            let char = string[string.index(string.startIndex, offsetBy: i-1)]
            let pre = string[string.index(string.startIndex, offsetBy: i-2)]
            if let number = Int("\(pre)\(char)"), number >= 10, number <= 25 {
                dpi = dpx + dpxx
            } else {
               dpi = dpx
            }
            if dpi > ret {
                ret = dpi
            }
            dpxx = dpx
            dpx = dpi
        }
        
        return ret
    }
}

