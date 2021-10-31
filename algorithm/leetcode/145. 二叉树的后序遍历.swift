//
//  145. 二叉树的后序遍历.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/31.
//

import Foundation

// https://leetcode-cn.com/problems/binary-tree-postorder-traversal/
// 后续遍历为： 左右中
// 翻转变形：中右左
// 其实就像：中左右（前序遍历）所以可以使用类似前序遍历的方法遍历，之后翻转结果
class TreePostorderTraversal {
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }

        var ret = [Int]()
        var stack = [root]
        
        while !stack.isEmpty {
            let node = stack.removeLast()
            ret.append(node.val)
            if let left = node.left {
                stack.append(left)
            }
            if let right = node.right {
                stack.append(right)
            }
        }
        
        return ret.reversed()
    }
}
