// #Easy #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Level_2_Day_7_Tree
// #Udemy_Tree_Stack_Queue #Big_O_Time_O(n)_Space_O(n)
// #2024_10_12_Time_326_ms_(89.47%)_Space_148.9_MB_(78.95%)

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
  int diameter = 0;

  int diameterOfBinaryTree(TreeNode? root) {
    diameter = 0;
    _diameterOfBinaryTreeUtil(root);
    return diameter;
  }

  int _diameterOfBinaryTreeUtil(TreeNode? root) {
    if (root == null) {
      return 0;
    }
    int leftLength = root.left != null ? 1 + _diameterOfBinaryTreeUtil(root.left) : 0;
    int rightLength = root.right != null ? 1 + _diameterOfBinaryTreeUtil(root.right) : 0;
    diameter = diameter > (leftLength + rightLength) ? diameter : (leftLength + rightLength);
    return leftLength > rightLength ? leftLength : rightLength;
  }
}
