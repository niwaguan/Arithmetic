//
//  TreeNode.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/31.
//

import Foundation

class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public convenience init?(_ value: Int?) {
        guard let val = value else {
            return nil
        }
        self.init(val)
    }
    
    /// 广度优先遍历生成树
    /// - Parameter from: 树的节点值
    /// - Returns: 树的根节点
    static func buildTree(from: [Int?]) -> TreeNode? {
        guard from.count > 0, let v1 = from.first, let value = v1 else {
            return nil
        }
        
        let root = TreeNode(value)
        var queue = [root]
        var valueIndex = 1
        while !queue.isEmpty {
            let node = queue.removeLast()
            if valueIndex < from.count {
                node.left = TreeNode(from[valueIndex])
            }
            if let left = node.left {
                queue.insert(left, at: 0)
            }
            valueIndex += 1
            if valueIndex < from.count {
                node.right = TreeNode(from[valueIndex])
            }
            if let right = node.right {
                queue.insert(right, at: 0)
            }
            valueIndex += 1
        }
        
        
        return root
    }
    
    
    /// 根据二叉树先序遍历和中序遍历构建二叉树
    /// [3,9,20,15,7]
    /// [9,3,15,20,7]
    /// - Parameters:
    ///   - preorder: 先序遍历序列
    ///   - inorder: 中序遍历序列
    /// - Returns: 根节点
    static func buldTreeFrom(preorder: [Int], inorder: [Int]) -> TreeNode? {
        // 先序遍历序列中，每一个元素都是一个子树的根
        // 根据先序遍历的根，在中序序列中找左右子树
        guard preorder.count > 0 else {
            return nil
        }
        
        func buildNode(at index: Int, from: Int, to: Int) -> TreeNode? {
            guard index >= 0, index < preorder.count,
                  from <= to,
                  let inorderIndex = inorder.firstIndex(of: preorder[index])  else {
                return nil
            }
            // 根节点索引index
            let root = TreeNode(preorder[index])
            // 根据先序遍历序列，左子树根+1
            root.left = buildNode(at: index + 1, from: from, to: inorderIndex - 1)
            // 右子树节点为 根节点 + 左子树长度 + 1
            root.right = buildNode(at: index + (inorderIndex - from) + 1, from: inorderIndex + 1, to: to)
            return root
        }
        
        return buildNode(at: 0, from: 0, to: preorder.count - 1)
    }
    
    @discardableResult
    /// 递归先序遍历
    func preorderByRecursive() -> TreeNode {
        
        var ret = [Int]()
        
        func recursive(_ root: TreeNode?) {
            guard let root = root else {
                return
            }
            ret.append(root.val)
            recursive(root.left)
            recursive(root.right)
        }
        
        // 先序遍历
        recursive(self)
        
        print(ret)
        
        return self
    }
    
    @discardableResult
    /// 递归中序遍历
    func midorderByByRecursive() -> TreeNode {
        
        var ret = [Int]()
        
        func recursive(_ root: TreeNode?) {
            guard let root = root else {
                return
            }
            recursive(root.left)
            ret.append(root.val)
            recursive(root.right)
        }
        
        // 先序遍历
        recursive(self)
        
        print(ret)
        
        return self
    }
    
    @discardableResult
    /// 递归后续遍历
    func postorderByByRecursive() -> TreeNode {
        
        var ret = [Int]()
        
        func recursive(_ root: TreeNode?) {
            guard let root = root else {
                return
            }
            recursive(root.left)
            recursive(root.right)
            ret.append(root.val)
        }
        
        // 先序遍历
        recursive(self)
        
        print(ret)
        
        return self
    }
    
    @discardableResult
    /// 循环先序遍历
    func preorderByLoop() -> TreeNode {
        
        var stack = [TreeNode]()
        var ret = [Int]()
        
        stack.append(self)
        while !stack.isEmpty {
            let node = stack.removeLast()
            ret.append(node.val)
            
            // 栈是先入后出，要先访问左节点，就需要后入。所以这里先入栈右节点
            if let right = node.right {
                stack.append(right)
            }
            
            if let left = node.left {
                stack.append(left)
            }
        }
        
        print(ret)
        return self
    }
    
    @discardableResult
    func midorderByLoop() -> TreeNode {
        
        var cur: TreeNode?
        var stack = [TreeNode]()
        var ret = [Int]()
        
        cur = self
        while cur != nil || !stack.isEmpty {
            // 顺着左子树一直入栈
            while cur != nil {
                stack.append(cur!)
                cur = cur?.left
            }
            // 最后一个左子树节点，最后入栈，最先出栈
            let tmp = stack.removeLast()
            ret.append(tmp.val)
            cur = tmp.right
        }
        print(ret)
        return self
    }
    
    @discardableResult
    func postorderByLoop() -> TreeNode {
        // 先序   中左右
        // 变异   中右左
        // 翻转
        // 后续   左右中
        var stack = [self]
        var ret = [Int]()
        while !stack.isEmpty {
            let node = stack.removeLast()
            ret.append(node.val)
            if let left = node.left {
                stack.append(left)
            }
            if let right = node.right {
                stack.append(right)
            }
        }
        print(Array(ret.reversed()))
        return self
    }
    
}
