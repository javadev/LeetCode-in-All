package g0401_0500.s0437_path_sum_iii

// #Medium #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Level_2_Day_7_Tree
// #Big_O_Time_O(n)_Space_O(n) #2023_11_08_Time_498_ms_(90.91%)_Space_57.3_MB_(72.73%)

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
    def pathSum(root: TreeNode, targetSum: Int): Int = {
        if (root == null) return 0
        pathSum(root.left, targetSum) + pathSum(root.right, targetSum) + dfsPath(root, 0, targetSum)
    }

    private def dfsPath(root: TreeNode, sum: Long, targetSum: Long): Int = {
        if (root == null) return 0
        val cumSum = sum + root.value
        val counter = if (cumSum == targetSum) 1 else 0
        counter + dfsPath(root.left, cumSum, targetSum) + dfsPath(root.right, cumSum, targetSum)
    }
}
