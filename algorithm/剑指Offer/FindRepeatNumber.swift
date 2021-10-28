//
//  FindRepeatNumber.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/28.
//

import Foundation

// https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/
class FindRepeatNumber {
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var tabs = [Int: Bool]()
        for i in nums {
            if tabs[i] != nil  {
                return i
            }
            tabs[i] = true
        }
        return 0
    }
}
