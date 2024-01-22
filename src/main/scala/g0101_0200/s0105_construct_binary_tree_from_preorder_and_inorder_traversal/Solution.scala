package g0101_0200.s0105_construct_binary_tree_from_preorder_and_inorder_traversal

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Tree #Binary_Tree
// #Divide_and_Conquer #Data_Structure_II_Day_15_Tree #Big_O_Time_O(N)_Space_O(N)
// #2023_11_03_Time_564_ms_(91.67%)_Space_58.5_MB_(58.33%)

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
    def buildTree(preorder: Array[Int], inorder: Array[Int]): TreeNode = {
        val map = inorder.zipWithIndex.toMap
        var j = 0

        def answer(start: Int, end: Int): TreeNode = {
            if (start > end || j >= preorder.length) {
                null
            } else {
                val value = preorder(j)
                j += 1
                val index = map(value)
                val node = new TreeNode(value)
                node.left = answer(start, index - 1)
                node.right = answer(index + 1, end)
                node
            }
        }

        answer(0, preorder.length - 1)
    }
}
