//
//  TreeIsBalance.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/11.
//

import Foundation
/// 平衡二叉树的判断
/// https://leetcode-cn.com/problems/ping-heng-er-cha-shu-lcof/
class TreeIsBalance {
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        
        func height(of tree: TreeNode?) -> Int {
            guard let tree = tree else {
                return 0
            }
            let left = height(of: tree.left)
            let right = height(of: tree.right)
            if left < 0 || right < 0 || abs(left - right) > 1 {
                return -1
            }
            
            return max(left, right) + 1
        }
        
        return height(of: root) >= 0
    }
}
