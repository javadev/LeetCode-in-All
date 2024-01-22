package g0101_0200.s0101_symmetric_tree

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Breadth_First_Search
// #Tree #Binary_Tree #Data_Structure_I_Day_11_Tree #Level_2_Day_15_Tree
// #Big_O_Time_O(N)_Space_O(log(N)) #2023_11_03_Time_454_ms_(90.38%)_Space_57.2_MB_(28.85%)

import com_github_leetcode.TreeNode

/*
 * Definition for a binary tree node.
 * class TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
 *   var value: Int = _value
 *   var left: TreeNode = _left
 *   var right: TreeNode = _right
 * }
 */
object Solution {
    def isSymmetric(root: TreeNode): Boolean = {
        if (root == null) {
            true
        } else {
            helper(root.left, root.right)
        }
    }

    private def helper(leftNode: TreeNode, rightNode: TreeNode): Boolean = {
        if (leftNode == null || rightNode == null) {
            leftNode == null && rightNode == null
        } else if (leftNode.value != rightNode.value) {
            false
        } else {
            helper(leftNode.left, rightNode.right) && helper(leftNode.right, rightNode.left)
        }
    }
}
