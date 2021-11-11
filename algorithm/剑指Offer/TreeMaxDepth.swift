//
//  TreeMaxDepth.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/11.
//

import Foundation

/// 二叉树的深度
/// https://leetcode-cn.com/problems/er-cha-shu-de-shen-du-lcof/
class TreeMaxDepth {
    
    func maxDepth(_ root: TreeNode?) -> Int {
        var ret = 0
        var depth = 0
        func dfs(_ root: TreeNode?) {
            guard let root = root else {
                return
            }
            ret += 1
            
            if root.left == nil && root.right == nil {
                depth = max(depth, ret)
            }
            dfs(root.left)
            dfs(root.right)
            
            ret -= 1
        }
        dfs(root)
        return depth
    }
}
