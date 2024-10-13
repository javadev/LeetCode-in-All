// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Depth_First_Search
// #Tree #Binary_Tree #Udemy_Tree_Stack_Queue #Big_O_Time_O(N)_Space_O(N)
// #2024_10_07_Time_333_ms_(85.71%)_Space_150.9_MB_(42.86%)

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
  int _max = -999999999; // Use a large negative value instead of -double.infinity.toInt()

  int _helper(TreeNode? root) {
    if (root == null) {
      return 0;
    }

    // Avoid negative values by comparing with 0
    int left = _helper(root.left).clamp(0, 999999999);
    int right = _helper(root.right).clamp(0, 999999999);

    int current = root.val + left + right;

    // Update max if current path sum is greater
    if (current > _max) {
      _max = current;
    }

    // Return the max path sum that can be used by the parent node
    return root.val + left.max(right);
  }

  int maxPathSum(TreeNode? root) {
    _helper(root);
    return _max;
  }
}

extension IntExtension on int {
  int max(int other) => this > other ? this : other;
}
