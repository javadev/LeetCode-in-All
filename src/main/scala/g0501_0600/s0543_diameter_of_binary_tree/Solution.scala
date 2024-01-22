package g0501_0600.s0543_diameter_of_binary_tree

// #Easy #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Level_2_Day_7_Tree
// #Udemy_Tree_Stack_Queue #Big_O_Time_O(n)_Space_O(n)
// #2023_11_09_Time_479_ms_(90.48%)_Space_56.8_MB_(71.43%)

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
    private var diameter: Int = 0

    def diameterOfBinaryTree(root: TreeNode): Int = {
        diameter = 0
        diameterOfBinaryTreeUtil(root)
        diameter
    }

    private def diameterOfBinaryTreeUtil(root: TreeNode): Int = {
        if (root == null) {
            return 0
        }

        val leftLength = if (root.left != null) 1 + diameterOfBinaryTreeUtil(root.left) else 0
        val rightLength = if (root.right != null) 1 + diameterOfBinaryTreeUtil(root.right) else 0

        diameter = Math.max(diameter, leftLength + rightLength)
        Math.max(leftLength, rightLength)
    }
}
