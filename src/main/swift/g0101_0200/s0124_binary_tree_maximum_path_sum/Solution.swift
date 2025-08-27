// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Depth_First_Search
// #Tree #Binary_Tree #Udemy_Tree_Stack_Queue #Top_Interview_150_Binary_Tree_General
// #Big_O_Time_O(N)_Space_O(N) #2024_06_27_Time_28_ms_(98.45%)_Space_17.1_MB_(67.36%)

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
public class Solution {
    private var maxSum = Int.min

    private func helper(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }

        let left = max(0, helper(root.left))
        let right = max(0, helper(root.right))
        let current = root.val + left + right
        maxSum = max(maxSum, current)

        return root.val + max(left, right)
    }

    public func maxPathSum(_ root: TreeNode?) -> Int {
        _ = helper(root)
        return maxSum
    }
}
