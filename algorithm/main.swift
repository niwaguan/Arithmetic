//
//  main.swift
//  algorithm
//
//  Created by Gaoyang on 2021/3/13.
//

import Foundation

let node3 = LevelOrder3.TreeNode(3)
let node9 = LevelOrder3.TreeNode(9)
let node20 = LevelOrder3.TreeNode(20)
let node15 = LevelOrder3.TreeNode(15)
let node7 = LevelOrder3.TreeNode(7)

node3.left = node9
node3.right = node20

node20.left = node15
node20.right = node7

print(LevelOrder3().levelOrder(node3))
