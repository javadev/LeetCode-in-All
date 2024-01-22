package g0201_0300.s0236_lowest_common_ancestor_of_a_binary_tree

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Tree #Binary_Tree
// #Data_Structure_II_Day_18_Tree #Udemy_Tree_Stack_Queue #Big_O_Time_O(n)_Space_O(n)
// #2023_11_07_Time_539_ms_(70.73%)_Space_59.3_MB_(29.27%)

import com_github_leetcode.TreeNode

/*
 * Definition for a binary tree node.
 * class TreeNode(var _value: Int) {
 *   var value: Int = _value
 *   var left: TreeNode = null
 *   var right: TreeNode = null
 * }
 */
object Solution {
    def lowestCommonAncestor(root: TreeNode, p: TreeNode, q: TreeNode): TreeNode = {
        if (root == null) {
            return null
        }
        if (root.value == p.value || root.value == q.value) {
            return root
        }
        val left = lowestCommonAncestor(root.left, p, q)
        val right = lowestCommonAncestor(root.right, p, q)
        if (left != null && right != null) {
            return root
        }
        if (left != null) {
            return left
        }
        right
    }
}
