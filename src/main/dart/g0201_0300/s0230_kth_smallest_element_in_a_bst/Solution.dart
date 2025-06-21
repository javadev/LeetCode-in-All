// #Medium #Top_100_Liked_Questions #Depth_First_Search #Tree #Binary_Tree #Binary_Search_Tree
// #Data_Structure_II_Day_17_Tree #Level_2_Day_9_Binary_Search_Tree
// #Top_Interview_150_Binary_Search_Tree #Big_O_Time_O(n)_Space_O(n)
// #2024_10_09_Time_322_ms_(85.71%)_Space_152.8_MB_(10.71%)

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
  late int k;
  int count = 0;
  int? val;

  int kthSmallest(TreeNode? root, int k) {
    this.k = k;
    _calculate(root);
    return val!;
  }

  void _calculate(TreeNode? node) {
    if (node == null) return;

    if (node.left != null) {
      _calculate(node.left);
    }

    count++;
    if (count == k) {
      val = node.val;
      return;
    }

    if (node.right != null) {
      _calculate(node.right);
    }
  }
}
