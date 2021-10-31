//
//  LevelOrder3.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/30.
//

import Foundation

// https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-iii-lcof/
class LevelOrder3 {
    
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
        var reverse = false
        
        while !queue.isEmpty {
            let size = queue.count
            var levelNodes = [TreeNode]()
            // 收集当前层的节点
            for _ in 0..<size {
                let node = queue.removeLast()
                levelNodes.append(node)
                
                if let left = node.left {
                    queue.insert(left, at: 0)
                }
                if let right = node.right {
                    queue.insert(right, at: 0)
                }
            }
            
            var levelValues = [Int]()
            for node in reverse ? levelNodes.reversed() : levelNodes {
                levelValues.append(node.val)
            }
            
            ret.append(levelValues)
            reverse.toggle()
        }

        return ret
    }
}
