//
//  main.swift
//  algorithm
//
//  Created by Gaoyang on 2021/3/13.
//

import Foundation

let cases = [
    [ 10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ],
    [1, 2, 3, 4, 5],
    [0,1,2,1],
    [0,1,2,1],
    [3,2,1],
    [0,0,2,3,2,1,1,2,0,4]
]

let sorter = Quick()
let search = ArrayKthLeastNumbers()
cases.forEach {
    let ret = sorter.sort($0)
    let answer = $0.sorted()
    print(answer.description == ret.description ? "✅" : "❌", ret)
    print("🔍", search.getLeastNumbers($0, min(10, $0.count)))
}
