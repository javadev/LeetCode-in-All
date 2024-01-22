package g0101_0200.s0104_maximum_depth_of_binary_tree

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Breadth_First_Search
// #Tree #Binary_Tree #Data_Structure_I_Day_11_Tree
// #Programming_Skills_I_Day_10_Linked_List_and_Tree #Udemy_Tree_Stack_Queue
// #Big_O_Time_O(N)_Space_O(H) #2023_11_03_Time_472_ms_(90.83%)_Space_57_MB_(67.89%)

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
    def maxDepth(root: TreeNode): Int = {
        if (root == null) {
            0
        } else {
            val leftDepth = maxDepth(root.left)
            val rightDepth = maxDepth(root.right)
            1 + Math.max(leftDepth, rightDepth)
        }
    }
}
