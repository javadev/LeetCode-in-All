package g0101_0200.s0102_binary_tree_level_order_traversal

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Breadth_First_Search #Tree
// #Binary_Tree #Data_Structure_I_Day_11_Tree #Level_1_Day_6_Tree #Udemy_Tree_Stack_Queue
// #Big_O_Time_O(N)_Space_O(N) #2023_11_03_Time_522_ms_(83.33%)_Space_57.8_MB_(54.17%)

import com_github_leetcode.TreeNode
import scala.collection.mutable.{ListBuffer, Queue}

/*
 * Definition for a binary tree node.
 * class TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
 *   var value: Int = _value
 *   var left: TreeNode = _left
 *   var right: TreeNode = _right
 * }
 */
object Solution {
    def levelOrder(root: TreeNode): List[List[Int]] = {
        val result = ListBuffer[List[Int]]()
        if (root == null) {
            return result.toList
        }
        val queue = Queue[TreeNode]()
        queue.enqueue(root)
        queue.enqueue(null)
        val level = ListBuffer[Int]()

        while (queue.nonEmpty) {
            val current = queue.dequeue()
            if (current != null) {
                level += current.value
                if (current.left != null) {
                    queue.enqueue(current.left)
                }
                if (current.right != null) {
                    queue.enqueue(current.right)
                }
            } else if (level.nonEmpty) {
                result += level.toList
                level.clear()
                queue.enqueue(null)
            }
        }

        result.toList
    }
}
