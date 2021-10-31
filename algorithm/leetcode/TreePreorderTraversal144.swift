//
//  TreePreorderTraversal144.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/31.
//

import Foundation

class TreePreorderTraversal144 {
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var ret = [Int]()
        var stack: [TreeNode] = []
        
        // 当前处理的node
        var node: TreeNode? = root
        while !stack.isEmpty || node != nil {
            // 将该node的左子树加入栈
            while node != nil {
                ret.append(node!.val)
                stack.append(node!)
                node = node?.left
            }
            
            let x = stack.removeLast()
            node = x.right
        }
        return ret
    }
}
