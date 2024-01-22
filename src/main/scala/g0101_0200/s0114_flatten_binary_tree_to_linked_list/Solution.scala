package g0101_0200.s0114_flatten_binary_tree_to_linked_list

// #Medium #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Stack #Linked_List
// #Udemy_Linked_List #Big_O_Time_O(N)_Space_O(N)
// #2023_11_03_Time_491_ms_(54.17%)_Space_57.5_MB_(41.67%)

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
    def flatten(root: TreeNode): Unit = {
        if (root != null) {
            modifyToRight(root)
        }
    }

    private def modifyToRight(root: TreeNode): TreeNode = {
        if (root.left == null && root.right == null) {
            root
        } else if (root.left == null) {
            root.right = modifyToRight(root.right)
            root
        } else if (root.right == null) {
            val left = modifyToRight(root.left)
            root.left = null
            root.right = left
            root
        } else {
            val left = modifyToRight(root.left)
            val right = modifyToRight(root.right)
            traverseAndAppend(left, right)
            root.right = left
            root.left = null
            root
        }
    }

    private def traverseAndAppend(root: TreeNode, right: TreeNode): Unit = {
        if (root.right != null) {
            traverseAndAppend(root.right, right)
        } else {
            root.right = right
        }
    }
}
