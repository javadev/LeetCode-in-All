// #Medium #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Stack #Linked_List
// #Udemy_Linked_List #Big_O_Time_O(N)_Space_O(N)
// #2024_10_06_Time_316_ms_(100.00%)_Space_148.5_MB_(90.91%)

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
  void flatten(TreeNode? root) {
    if (root != null) {
      _findTail(root);
    }
  }

  TreeNode _findTail(TreeNode root) {
    TreeNode? left = root.left;
    TreeNode? right = root.right;
    TreeNode tail;

    // Find the tail of the left subtree (the leftmost leaf)
    if (left != null) {
      tail = _findTail(left);
      // Stitch the right subtree below the tail
      root.left = null;
      root.right = left;
      tail.right = right;
    } else {
      tail = root;
    }

    // Find the tail of the right subtree
    if (tail.right == null) {
      return tail;
    } else {
      return _findTail(tail.right!);
    }
  }
}
