package g0201_0300.s0230_kth_smallest_element_in_a_bst

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Tree #Binary_Tree
// #Binary_Search_Tree #Data_Structure_II_Day_17_Tree #Level_2_Day_9_Binary_Search_Tree
// #Big_O_Time_O(n)_Space_O(n) #2023_11_07_Time_503_ms_(91.30%)_Space_57.9_MB_(60.87%)

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
    var index = 0
    var value = -1

    def kthSmallest(root: TreeNode, k: Int): Int = {
        index = 0
        value = -1
        if (root == null) -1
        else inorder(root, k)
        value
    }

    // Using In order
    def inorder(root: TreeNode, k: Int): Unit = {
        if (root != null && index < k) {
            inorder(root.left, k)
            index += 1
            if (index == k) value = root.value
            inorder(root.right, k)
        }
    }
}
