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
    
    var array: [Int] = []

    override func setUp() {
        var count = 30
        while count > 0 {
            array.append(Int(arc4random() % 100))
            count -= 1
        }
        array = countingSort(array)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let result = binarySearch(array.first!, in: array)
        
        print(result)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        
        self.measure {
            _ = countingSort(array)
        }
        
//        self.measure {
//            _ = insertionSort(array)
//        }
//        
//        self.measure {
//            _ = selectionSort(array)
//        }
    }

}
