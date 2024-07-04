// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Tree #Binary_Tree
// #Stack #Data_Structure_I_Day_10_Tree #Udemy_Tree_Stack_Queue #Big_O_Time_O(n)_Space_O(n)
// #2024_06_25_Time_0_ms_(100.00%)_Space_15.9_MB_(56.70%)

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
