//
//  TreePathSum.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/8.
//

import Foundation

/// 二叉树路径和
/// https://leetcode-cn.com/problems/er-cha-shu-zhong-he-wei-mou-yi-zhi-de-lu-jing-lcof/
class TreePathSum {
    func isLeaf(node: TreeNode) -> Bool {
        return node.left == nil && node.right == nil
    }
    
    func pathSum(_ root: TreeNode?, _ target: Int) -> [[Int]] {
        
        var path = [Int]()
        var paths = [[Int]]()
        
        func dfs(_ root: TreeNode?, sum: Int) {
            guard let root = root else {
                return
            }
            
            path.append(root.val)
            
            if isLeaf(node: root) && root.val == sum {
                paths.append(path)
            }
            dfs(root.left, sum: sum - root.val)
            dfs(root.right, sum: sum - root.val)
            
            path.removeLast()
        }
        
        dfs(root, sum: target)
        
        return paths
    }
}
