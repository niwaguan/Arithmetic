//
//  IsSubStructure.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/31.
//

import Foundation

/// https://leetcode-cn.com/problems/shu-de-zi-jie-gou-lcof/
/// 按层次遍历树每一层的结构都应该相同
class IsSubStructure {
    
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        guard let A = A, let B = B else {
            return false
        }
        
        var treeStack = [A]
        // 遍历A树，查找可能是开始节点
        while !treeStack.isEmpty {
            let treeNode = treeStack.removeLast()
            // 从该节点开始，可能是子树的结构
            if treeNode.val == B.val {
                // 以子树结构为主，开始遍历子树和参考树
                var mainQueue = [B]
                var secondQueue = [treeNode]
                var breaked = false
                while !mainQueue.isEmpty {
                    // 遍历当前层次
                    for _ in 0..<mainQueue.count {
                        let mainNode = mainQueue.removeLast()
                        // 子树没有遍历完，参考树已经没有节点了，直接返回
                        if secondQueue.isEmpty {
                            return false
                        }
                        let secondNode = secondQueue.removeLast()
                        
                        if mainNode.val != secondNode.val {
                            breaked = true
                            break
                        }
                        if let node = mainNode.left {
                            mainQueue.insert(node, at: 0)
                        }
                        if let node = mainNode.right {
                            mainQueue.insert(node, at: 0)
                        }
                        if let node = secondNode.left {
                            secondQueue.insert(node, at: 0)
                        }
                        if let node = secondNode.right {
                            secondQueue.insert(node, at: 0)
                        }
                    }
                    if breaked {
                        break
                    }
                }
                if !breaked {
                    return true
                }
            }
            if let right = treeNode.right {
                treeStack.append(right)
            }
            if let left = treeNode.left {
                treeStack.append(left)
            }
        }
        
        return false
    }
}
