//
//  TreePreorderTraversal144.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/31.
//

import Foundation

class TreePreorderTraversal144 {
    
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
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var ret = [Int]()
        var stack = [root]
        while !stack.isEmpty {
            let node = stack.removeLast()
            
            ret.append(node.val)
            
            if let right = node.right {
                stack.append(right)
            }
            
            if let left = node.left {
                stack.append(left)
            }
        }
        return ret
    }
}
