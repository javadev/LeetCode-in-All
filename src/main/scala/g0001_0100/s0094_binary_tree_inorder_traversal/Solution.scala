package g0001_0100.s0094_binary_tree_inorder_traversal

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Tree #Binary_Tree
// #Stack #Data_Structure_I_Day_10_Tree #Udemy_Tree_Stack_Queue #Big_O_Time_O(n)_Space_O(n)
// #2023_11_03_Time_456_ms_(68.42%)_Space_57.3_MB_(7.89%)

import com_github_leetcode.TreeNode
import scala.collection.mutable.ListBuffer

/*
 * Definition for a binary tree node.
 * class TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
 *   var value: Int = _value
 *   var left: TreeNode = _left
 *   var right: TreeNode = _right
 * }
 */
object Solution {
    def inorderTraversal(root: TreeNode): List[Int] = {
        if (root == null) {
            List.empty
        } else {
            val answer = ListBuffer[Int]()
            inorderTraversal(root, answer)
            answer.toList
        }
    }

    private def inorderTraversal(root: TreeNode, answer: ListBuffer[Int]): Unit = {
        if (root == null) {
            return
        }
        if (root.left != null) {
            inorderTraversal(root.left, answer)
        }
        answer += root.value
        if (root.right != null) {
            inorderTraversal(root.right, answer)
        }
    }
}
