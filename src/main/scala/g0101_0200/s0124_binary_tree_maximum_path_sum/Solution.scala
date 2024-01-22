package g0101_0200.s0124_binary_tree_maximum_path_sum

// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Depth_First_Search
// #Tree #Binary_Tree #Udemy_Tree_Stack_Queue #Big_O_Time_O(N)_Space_O(N)
// #2023_11_03_Time_523_ms_(89.47%)_Space_57.9_MB_(73.68%)

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
    def maxPathSum(root: TreeNode): Int = {
        var max = Int.MinValue

        def helper(node: TreeNode): Int = {
            if (node == null) {
                return 0
            }

            // To avoid negative values on the left side, we compare them with 0.
            val left = math.max(0, helper(node.left))
            val right = math.max(0, helper(node.right))
            val current = node.value + left + right

            if (current > max) {
                max = current
            }

            node.value + math.max(left, right)
        }

        helper(root)
        max
    }
}
