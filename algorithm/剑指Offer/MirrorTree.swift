//
//  MirrorTree.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/31.
//

import Foundation

class MirrorTree {
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        func mirror(_ node: TreeNode) -> TreeNode {
            let copyed = TreeNode(node.val)
            if let right = node.right {
                copyed.left = mirror(right)
            }
            if let left = node.left {
                copyed.right = mirror(left)
            }
            return copyed
        }
        guard let root = root else {
            return nil
        }
        
        
        return mirror(root)
    }
}
