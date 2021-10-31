//
//  32.从上到下打印二叉树.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/30.
//

import Foundation

class LevelOrder {
    
    func levelOrder(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return [Int]()
        }

        var ret = [Int]()
        // -> -> ->
        var queue = [root]
        
        while !queue.isEmpty {
            let node = queue.removeLast()
            ret.append(node.val)
            
            if let left = node.left {
                queue.insert(left, at: 0)
            }
            if let right = node.right {
                queue.insert(right, at: 0)
            }
        }
        
        return ret
    }
}
