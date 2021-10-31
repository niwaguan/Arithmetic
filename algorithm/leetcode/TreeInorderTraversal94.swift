//
//  TreeInorderTraversal94.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/31.
//

import Foundation

// https://leetcode-cn.com/problems/binary-tree-inorder-traversal/submissions/
class TreeInorderTraversal94 {
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var ret = [Int]()
        var stack = [TreeNode]()
        var node: TreeNode? = root
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            let x = stack.removeLast()
            ret.append(x.val)
            node = x.right
        }
        return ret
    }
}
