//
//  main.swift
//  LeetCodeXProject
//
//  Created by 高洋 on 2019/4/19.
//  Copyright © 2019 Zhibai. All rights reserved.
//

import Foundation

func queueTests() {
    let queue = ArrayQueue<Int>(3)
    var dequeueElement: String = ""
    
    func enqueueElement(_ element: Int) {
        print("-------↓入队\(element)-------")
        let result = queue.enqueue(element)
        print("操作结果：\(result)\n排队情况：\(queue)\n实际内存：\(queue.acutalElements)")
    }
    
    func dequeue() {
        print("-------出队↑-------")
        let dequeueElement = String(describing: queue.dequeue())
        print("出队元素：\(dequeueElement)\n排队情况：\(queue)\n实际内存：\(queue.acutalElements)")
    }
    
    enqueueElement(1)
    enqueueElement(2)
    enqueueElement(3)
    
    dequeue()
    dequeue()
    
    enqueueElement(4)
    enqueueElement(5)
}

func sortTests() {
    var count = 30
    var array = [Int]()
    while count > 0 {
        let number = arc4random() % 100
        array.append(Int(number))
        count -= 1
    }
    print(array)
    print(bubbleSort(array))
    print(insertionSort(array))
    print(selectionSort(array))
    print(mergeSort(array))
}

sortTests()
