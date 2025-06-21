// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Breadth_First_Search #Tree
// #Binary_Tree #Data_Structure_I_Day_11_Tree #Level_1_Day_6_Tree #Udemy_Tree_Stack_Queue
// #Top_Interview_150_Binary_Tree_BFS #Big_O_Time_O(N)_Space_O(N)
// #2024_10_06_Time_329_ms_(87.50%)_Space_151.4_MB_(25.00%)

import 'dart:collection';

/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class Solution {
  List<List<int>> levelOrder(TreeNode? root) {
    List<List<int>> result = [];
    if (root == null) {
      return result;
    }

    Queue<TreeNode?> queue = Queue<TreeNode?>();
    queue.add(root);
    queue.add(null); // Marker for level end

    List<int> level = [];

    while (queue.isNotEmpty) {
      root = queue.removeFirst();
      while (queue.isNotEmpty && root != null) {
        level.add(root.val);
        if (root.left != null) {
          queue.add(root.left);
        }
        if (root.right != null) {
          queue.add(root.right);
        }
        root = queue.removeFirst();
      }

      result.add(level);
      level = []; // Reset for the next level

      if (queue.isNotEmpty) {
        queue.add(null); // Marker for the next level end
      }
    }

    return result;
  }
}
