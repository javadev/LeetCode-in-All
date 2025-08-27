// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Breadth_First_Search
// #Tree #Binary_Tree #Data_Structure_I_Day_11_Tree #Level_2_Day_15_Tree
// #Top_Interview_150_Binary_Tree_General #Big_O_Time_O(N)_Space_O(log(N))
// #2024_06_25_Time_4_ms_(87.54%)_Space_15.5_MB_(35.61%)

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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        return helper(root.left, root.right)
    }

    private func helper(_ leftNode: TreeNode?, _ rightNode: TreeNode?) -> Bool {
        if leftNode == nil || rightNode == nil {
            return leftNode == nil && rightNode == nil
        }
        if leftNode!.val != rightNode!.val {
            return false
        }
        return helper(leftNode!.left, rightNode!.right) && helper(leftNode!.right, rightNode!.left)
    }
}
