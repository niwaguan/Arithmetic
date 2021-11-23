//
//  PrintNumbers.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/23.
//

import Foundation
/// 打印数字
/// https://leetcode-cn.com/problems/da-yin-cong-1dao-zui-da-de-nwei-shu-lcof/
class PrintNumbers {
    
    func printNumbers(_ n: Int) -> [Int] {
        
        var loop = n
        var maxNumber = 0
        while loop > 0 {
            loop -= 1
            var pair = maxNumber.multipliedReportingOverflow(by: 10)
            if pair.overflow {
                maxNumber = Int.max
                break
            }
            maxNumber = pair.partialValue
            
            pair = maxNumber.addingReportingOverflow(9)
            if pair.overflow {
                maxNumber = Int.max
                break
            }
            maxNumber = pair.partialValue
        }
        
        return (1...maxNumber).map { $0 }
    }
}
