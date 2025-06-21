// #Easy #Top_100_Liked_Questions #Depth_First_Search #Breadth_First_Search #Tree #Binary_Tree
// #Data_Structure_I_Day_12_Tree #Level_2_Day_6_Tree #Udemy_Tree_Stack_Queue
// #Top_Interview_150_Binary_Tree_General #Big_O_Time_O(n)_Space_O(n)
// #2024_10_09_Time_300_ms_(80.95%)_Space_148_MB_(67.86%)

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
  TreeNode? invertTree(TreeNode? root) {
    if (root == null) {
      return root;
    }
    invertTree(root.left);
    invertTree(root.right);
    TreeNode? temp = root.left;
    root.left = root.right;
    root.right = temp;
    return root;
  }
}
