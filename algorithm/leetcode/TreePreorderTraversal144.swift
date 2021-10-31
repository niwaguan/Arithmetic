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
        
        func search(node: TreeNode?) {
            guard let node = node else {
                return
            }

            ret.append(node.val)
            search(node: node.left)
            search(node: node.right)
        }
        
        search(node: root)
        
        return ret
    }
}
