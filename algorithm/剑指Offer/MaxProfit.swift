//
//  MaxProfit.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/1.
//

import Foundation

class MaxProfit {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxPrice = Int.min
        for i in 0..<prices.count {
            for j in (i+1)..<prices.count {
                let p = prices[j] - prices[i]
                if p > maxPrice {
                    maxPrice = p
                }
            }
        }
        return maxPrice
    }
}
