//
//  LeetCodeExampleTests.swift
//  LeetCodeExampleTests
//
//  Created by 高洋 on 2019/9/15.
//  Copyright © 2019 Gaoyang. All rights reserved.
//

import XCTest
@testable import LeetCodeExample

class LeetCodeExampleTests: XCTestCase {
    var solution: Solution!

    override func setUp() {
        solution = Solution()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        for i in 0...100000 {
            let s = Int(sqrt(Double(i)))
            XCTAssert(solution.isPerfectSquare(i) == (s * s == i))
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        
        self.measure {
            _ = solution.isPerfectSquare(1000000)
        }
//        
//        self.measure {
//            _ = selectionSort(array)
//        }
    }

}
