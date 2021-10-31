//
//  main.swift
//  algorithm
//
//  Created by Gaoyang on 2021/3/13.
//

import Foundation

// [4,2,3,4,5,6,7,8,9]

let nodea4 = TreeNode(-2)
let nodea2 = TreeNode(1)
//let nodea3 = TreeNode(6)
//
//let nodea42 = TreeNode(8)
//let nodea5 = TreeNode(3)
//let nodea6 = TreeNode(11)
//let nodea7 = TreeNode(7)
//
//let nodea8 = TreeNode(8)
//let nodea9 = TreeNode(9)

nodea4.left = nodea2
//nodea4.right = nodea3
//
//nodea2.left = nodea42
//nodea2.right = nodea5
//
//nodea3.left = nodea6
//nodea3.right = nodea7
//
//nodea42.left = nodea8
//nodea42.right = nodea9

// [4,8,9]
let node4 = TreeNode(-2)
let node12 = TreeNode(1)
let node9 = TreeNode(-2)

//let node8 = TreeNode(8)
//let node3 = TreeNode(3)
//let node11 = TreeNode(11)

node4.left = node12
node4.right = node9

//node12.left = node8
//node12.right = node3
//
//node9.left = node11

print(IsSubStructure().isSubStructure(nodea4, node4))

//print(TreePreorderTraversal144().preorderTraversal(nodea4))
//print(TreeInorderTraversal94().inorderTraversal(nodea4))
//print(TreePostorderTraversal().postorderTraversal(nodea4))
