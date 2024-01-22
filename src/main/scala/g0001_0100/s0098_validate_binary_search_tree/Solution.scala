package g0001_0100.s0098_validate_binary_search_tree

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Tree #Binary_Tree
// #Binary_Search_Tree #Data_Structure_I_Day_14_Tree #Level_1_Day_8_Binary_Search_Tree
// #Udemy_Tree_Stack_Queue #Big_O_Time_O(N)_Space_O(log(N))
// #2023_11_03_Time_507_ms_(70.21%)_Space_57_MB_(93.62%)

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
    def isValidBST(root: TreeNode): Boolean = {
        def solve(node: TreeNode, left: Long, right: Long): Boolean = {
            if (node == null) {
                true
            } else if (node.value <= left || node.value >= right) {
                false
            } else {
                solve(node.left, left, node.value) && solve(node.right, node.value, right)
            }
        }

        solve(root, Long.MinValue, Long.MaxValue)
    }
}
