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
    var diningPhilosopher: DiningPhilosopher!
    override func setUp() {
        diningPhilosopher = DiningPhilosopher()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        diningPhilosopher.perform()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        
//        
//        self.measure {
//            _ = selectionSort(array)
//        }
    }

}
