//
//  FirstUniqChar.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/30.
//

import Foundation
// https://leetcode-cn.com/problems/di-yi-ge-zhi-chu-xian-yi-ci-de-zi-fu-lcof/
class FirstUniqChar {
    func firstUniqChar(_ s: String) -> Character {
        var count = Array(repeating: UInt(0), count: 26)
        var targets = [Character]()
        for char in s {
            guard let i = char.asciiValue else {
                continue
            }
            let index = Int(i - 97)
            let counts = count[index]
            if counts > 0 {
                count[index] += 1
                targets.removeAll(where: { $0 == char })
            } else {
                count[index] = 1
                targets.append(char)
            }
        }
        return targets.first ?? " "
    }
}
