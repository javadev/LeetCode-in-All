// #Easy #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Level_2_Day_7_Tree
// #Udemy_Tree_Stack_Queue #Big_O_Time_O(n)_Space_O(n)
// #2024_07_03_Time_17_ms_(97.62%)_Space_16.3_MB_(100.00%)

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
    private var diameter: Int = 0

    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        diameter = 0
        _ = diameterOfBinaryTreeUtil(root)
        return diameter
    }

    private func diameterOfBinaryTreeUtil(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let leftLength = root.left != nil ? 1 + diameterOfBinaryTreeUtil(root.left) : 0
        let rightLength = root.right != nil ? 1 + diameterOfBinaryTreeUtil(root.right) : 0
        diameter = max(diameter, leftLength + rightLength)
        return max(leftLength, rightLength)
    }
}
