// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Breadth_First_Search
// #Tree #Binary_Tree #Data_Structure_I_Day_11_Tree #Level_2_Day_15_Tree
// #Big_O_Time_O(N)_Space_O(log(N)) #2024_10_06_Time_316_ms_(95.59%)_Space_146.4_MB_(98.53%)

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
  bool isSymmetric(TreeNode? root) {
    if (root == null) {
      return true;
    }
    return _helper(root.left, root.right);
  }

  bool _helper(TreeNode? leftNode, TreeNode? rightNode) {
    if (leftNode == null || rightNode == null) {
      return leftNode == null && rightNode == null;
    }
    if (leftNode.val != rightNode.val) {
      return false;
    }
    return _helper(leftNode.left, rightNode.right) && _helper(leftNode.right, rightNode.left);
  }
}
