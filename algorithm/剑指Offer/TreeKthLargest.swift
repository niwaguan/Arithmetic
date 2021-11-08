//
//  TreeKthLargest.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/8.
//

import Foundation
// 二叉搜索树第k大节点
// https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-di-kda-jie-dian-lcof/
// 二叉搜索树中序遍历结果为递增序列。按右中左的顺序遍历为递减序列。
class TreeKthLargest {
    
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        
        var cur: TreeNode?
        var stack = [TreeNode]()
        var loop = k
        
        cur = root
        while cur != nil || !stack.isEmpty {
            // 顺着右子树一直入栈，栈顶为最大元素
            while cur != nil {
                stack.append(cur!)
                cur = cur?.right
            }
            
            let tmp = stack.removeLast()
            loop -= 1
            if loop == 0 {
                cur = tmp
                break
            }
            cur = tmp.left
        }
        return cur?.val ?? 0
    }
}
