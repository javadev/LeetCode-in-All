// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Tree #Binary_Tree
// #Divide_and_Conquer #Data_Structure_II_Day_15_Tree #Top_Interview_150_Binary_Tree_General
// #Big_O_Time_O(N)_Space_O(N) #2024_10_06_Time_315_ms_(100.00%)_Space_152.3_MB_(81.82%)

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
  int _j = 0;
  Map<int, int> _map = {};

  int get(int key) {
    return _map[key]!;
  }

  TreeNode? answer(List<int> preorder, List<int> inorder, int start, int end) {
    if (start > end || _j >= preorder.length) {
      return null;
    }
    int value = preorder[_j++];
    int index = get(value);
    TreeNode node = TreeNode(value);
    node.left = answer(preorder, inorder, start, index - 1);
    node.right = answer(preorder, inorder, index + 1, end);
    return node;
  }

  TreeNode? buildTree(List<int> preorder, List<int> inorder) {
    _j = 0;
    for (int i = 0; i < inorder.length; i++) {
      _map[inorder[i]] = i;
    }
    return answer(preorder, inorder, 0, preorder.length - 1);
  }
}
