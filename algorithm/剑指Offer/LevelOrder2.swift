//
//  LevelOrder2.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/30.
//

import Foundation

// https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-ii-lcof/
class LevelOrder2 {
    
    class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var queue = [root]
        var ret = [[Int]]()
        
        while !queue.isEmpty {
            let size = queue.count
            var level = [Int]()
            for _ in 0..<size {
                let node = queue.removeLast()
                level.append(node.val)
                if let left = node.left {
                    queue.insert(left, at: 0)
                }
                if let right = node.right {
                    queue.insert(right, at: 0)
                }
            }
            ret.append(level)
        }

        return ret
    }
}
