//
//  ReverseLeftWords.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/27.
//

import Foundation

// https://leetcode-cn.com/problems/zuo-xuan-zhuan-zi-fu-chuan-lcof/
// 目标字符串从指定索引分成左右两部分，然后right + left
class ReverseLeftWords {
    
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        let i = s.index(s.startIndex, offsetBy: n)
        let right = "\(s[i..<s.endIndex])"
        let left = "\(s[s.startIndex..<i])"
        return right + left
    }
}
