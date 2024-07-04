94\. Binary Tree Inorder Traversal

Easy

Given the `root` of a binary tree, return _the inorder traversal of its nodes' values_.

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/09/15/inorder_1.jpg)

**Input:** root = [1,null,2,3]

**Output:** [1,3,2] 

**Example 2:**

**Input:** root = []

**Output:** [] 

**Example 3:**

**Input:** root = [1]

**Output:** [1] 

**Example 4:**

![](https://assets.leetcode.com/uploads/2020/09/15/inorder_5.jpg)

**Input:** root = [1,2]

**Output:** [2,1] 

**Example 5:**

![](https://assets.leetcode.com/uploads/2020/09/15/inorder_4.jpg)

**Input:** root = [1,null,2]

**Output:** [1,2] 

**Constraints:**

*   The number of nodes in the tree is in the range `[0, 100]`.
*   `-100 <= Node.val <= 100`

**Follow up:** Recursive solution is trivial, could you do it iteratively?

To solve the "Binary Tree Inorder Traversal" problem in Swift with the Solution class, follow these steps:

1. Define a method `inorderTraversal` in the `Solution` class that takes the root of a binary tree as input and returns the inorder traversal of its nodes' values.
2. Implement an iterative algorithm to perform inorder traversal:
   - Initialize an empty list to store the inorder traversal result.
   - Initialize a stack to track the nodes during traversal.
   - Start with the root node and push it onto the stack.
   - While the stack is not empty:
     - Traverse down the left subtree by pushing all left child nodes onto the stack.
     - Pop the top node from the stack and add its value to the traversal result list.
     - Move to the right subtree of the popped node and repeat the process.
   - Return the traversal result list.
3. Return the inorder traversal result list.

Here's the implementation of the `inorderTraversal` method in Swift:

```swift
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        return inorderTraversalRecursive(root)
    }

    func inorderTraversalRecursive(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        
        func inorder(_ root: TreeNode?) {
            guard let root else {
                return
            }
            
            inorder(root.left)
            result.append(root.val)
            inorder(root.right)
        }
        
        inorder(root)
        
        return result
    }

    func inorderTraversalIterative(_ root: TreeNode?) -> [Int] {
        guard let root else {
            return []
        }
        
        var result: [Int] = []
        var stack: [TreeNode] = []
        stack.append(root)
        
        while !stack.isEmpty {
            let last = stack.last
            
            if let left = last?.left {
                stack.append(left)
            } else if let right = last?.right {
                let visited = stack.removeLast()
                result.append(visited.val)
                
                stack.append(right)
            } else {
                let visited = stack.removeLast()
                result.append(visited.val)
                
                stack.last?.left = nil
            }
        }
        
        return result
    }
}
```

This implementation performs an iterative inorder traversal of the binary tree using a stack, with a time complexity of O(N), where N is the number of nodes in the tree.