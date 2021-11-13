//
//  main.swift
//  algorithm
//
//  Created by Gaoyang on 2021/3/13.
//

import Foundation

let tree = TreeNode.buldTreeFrom(preorder: [3,9,20,15,7], inorder: [9,3,15,20,7])
tree?.preorderByLoop()
