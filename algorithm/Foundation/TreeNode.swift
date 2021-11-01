//
//  TreeNode.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/31.
//

import Foundation

class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public convenience init?(_ value: Int?) {
        guard let val = value else {
            return nil
        }
        self.init(val)
    }
    
    /// 广度优先遍历生成树
    /// - Parameter from: 树的节点值
    /// - Returns: 树的根节点
    static func buildTree(from: [Int?]) -> TreeNode? {
        guard from.count > 0, let v1 = from.first, let value = v1 else {
            return nil
        }
        
        let root = TreeNode(value)
        var queue = [root]
        var valueIndex = 1
        while !queue.isEmpty {
            let node = queue.removeLast()
            if valueIndex < from.count {
                node.left = TreeNode(from[valueIndex])
            }
            if let left = node.left {
                queue.insert(left, at: 0)
            }
            valueIndex += 1
            if valueIndex < from.count {
                node.right = TreeNode(from[valueIndex])
            }
            if let right = node.right {
                queue.insert(right, at: 0)
            }
            valueIndex += 1
        }
        
        
        return root
    }
}
