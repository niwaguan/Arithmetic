//
//  TreeVerifyBinaryPostorder.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/13.
//

import Foundation
// https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-hou-xu-bian-li-xu-lie-lcof/
class TreeVerifyBinaryPostorder {
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        guard postorder.count > 1 else {
            return true
        }
        
        func verify(root: Int, from: Int, to: Int) -> Bool {
            guard root >= 0, from <= to else {
                return true
            }
            let rootValue = postorder[root]
            // 向前查找右子树
            var right = root
            while right >= from, postorder[right] >= rootValue {
                right -= 1
            }
            
            // 继续向前查找左子树
            var left = right
            while left >= from, postorder[left] <= rootValue {
                left -= 1
            }
            
            // 满足此条件代表满足二叉搜索树的规律，则继续验证左右子树的序列
            if left + 1 == from {
                return verify(root: right, from: from, to: right) && verify(root: root - 1, from: right + 1, to: root - 1)
            }
            
            return false
        }
        
        return verify(root: postorder.count - 1, from: 0, to: postorder.count - 1)
    }
}
