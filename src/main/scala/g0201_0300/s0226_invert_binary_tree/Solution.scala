package g0201_0300.s0226_invert_binary_tree

// #Easy #Top_100_Liked_Questions #Depth_First_Search #Breadth_First_Search #Tree #Binary_Tree
// #Data_Structure_I_Day_12_Tree #Level_2_Day_6_Tree #Udemy_Tree_Stack_Queue
// #Big_O_Time_O(n)_Space_O(n) #2023_11_07_Time_421_ms_(97.33%)_Space_58.9_MB_(6.67%)

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
    def invertTree(root: TreeNode): TreeNode = {
        if (root == null) {
            return null
        }
        val temp = root.left
        root.left = invertTree(root.right)
        root.right = invertTree(temp)
        root
    }
}
