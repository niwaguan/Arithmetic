//
//  SymmetricTree.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/31.
//

import Foundation

// https://leetcode-cn.com/problems/dui-cheng-de-er-cha-shu-lcof/
// 两种遍历对比
// 中左右
// 中右左
// 每次遍历的节点值应该相同，包括nil
class SymmetricTree {
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }

        var leftStack: [TreeNode?] = [root]
        var rightStack: [TreeNode?] = [root]
        while !leftStack.isEmpty {
            let leftNode = leftStack.removeLast()
            let rightNode = rightStack.removeLast()
            
            if let left = leftNode, let right = rightNode, left.val != right.val {
                return false
            }
            
            if (leftNode != nil && rightNode == nil) || (leftNode == nil && rightNode != nil) {
                return false
            }
            
            if leftNode != nil {
                leftStack.append(leftNode?.left)
                leftStack.append(leftNode?.right)
            }
            if rightNode != nil {
                rightStack.append(rightNode?.right)
                rightStack.append(rightNode?.left)
            }
        }
        return true
    }
}
