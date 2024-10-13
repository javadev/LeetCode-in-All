// #Medium #Depth_First_Search #Tree #Binary_Tree #Level_2_Day_7_Tree #Big_O_Time_O(n)_Space_O(n)
// #2024_10_12_Time_357_ms_(100.00%)_Space_147.7_MB_(100.00%)

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
  int count = 0;

  int pathSum(TreeNode? root, int targetSum) {
    if (root == null) {
      return 0;
    }
    helper(root, targetSum, 0);
    pathSum(root.left, targetSum);
    pathSum(root.right, targetSum);
    return count;
  }

  void helper(TreeNode? node, int targetSum, int currSum) {
    if (node == null) {
      return;
    }
    currSum += node.val;
    if (targetSum == currSum) {
      count++;
    }
    helper(node.left, targetSum, currSum);
    helper(node.right, targetSum, currSum);
  }
}
