// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Tree #Binary_Tree
// #Binary_Search_Tree #Data_Structure_I_Day_14_Tree #Level_1_Day_8_Binary_Search_Tree
// #Udemy_Tree_Stack_Queue #Big_O_Time_O(N)_Space_O(log(N))
// #2024_10_06_Time_326_ms_(84.09%)_Space_151.4_MB_(31.82%)

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
  bool isValidBST(TreeNode? root) {
    return _isValidBSTHelper(root, null, null);
  }

  bool _isValidBSTHelper(TreeNode? node, int? min, int? max) {
    if (node == null) {
      return true;
    }

    if ((min != null && node.val <= min) || (max != null && node.val >= max)) {
      return false;
    }

    return _isValidBSTHelper(node.left, min, node.val) &&
        _isValidBSTHelper(node.right, node.val, max);
  }
}
