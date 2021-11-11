//
//  main.swift
//  algorithm
//
//  Created by Gaoyang on 2021/3/13.
//

import Foundation

let tree = TreeNode.buildTree(from: [5,4,8,11,nil,13,4,7,2,nil,nil,5,1])
print(TreePathSum().pathSum(tree, 22))
