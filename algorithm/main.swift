//
//  main.swift
//  algorithm
//
//  Created by Gaoyang on 2021/3/13.
//

import Foundation

print("----")
["+100", "5e2", "-123", "3.1416", "-1E-16", "0123"].forEach { string in
    print(IsNumber().isNumber(string))
}
print("----")
["12e", "1a3.14", "1.2.3", "+-5", "12e+5.4"].forEach { string in
    print(IsNumber().isNumber(string))
}
print("----")
["3. ", ".", "3.","1 ", "e9", "46.e3"].forEach { string in
    print(IsNumber().isNumber(string), "[\(string)]")
}


//print(Math.findContinuousSequence(of:20))
//
//print(TreeVerifyBinaryPostorder().verifyPostorder([1,6,3,2,5]))
//print(TreeVerifyBinaryPostorder().verifyPostorder([7, 5]))
//print(TreeVerifyBinaryPostorder().verifyPostorder([2, 5]))
//print(TreeVerifyBinaryPostorder().verifyPostorder([1,3,2,6,5]))
//print(TreeVerifyBinaryPostorder().verifyPostorder([1, 3, 2, 6, 8, 7, 5]))
