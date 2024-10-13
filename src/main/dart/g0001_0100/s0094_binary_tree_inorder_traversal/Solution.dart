// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Depth_First_Search #Tree #Binary_Tree
// #Stack #Data_Structure_I_Day_10_Tree #Udemy_Tree_Stack_Queue #Big_O_Time_O(n)_Space_O(n)
// #2024_10_06_Time_287_ms_(95.71%)_Space_151.5_MB_(11.43%)

/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class Stack<T> {
  final List<T> _items = [];

  void push(T item) {
    _items.add(item);
  }

  T pop() {
    return _items.removeLast();
  }

  T peek() {
    return _items.last;
  }

  bool get isEmpty {
    return _items.isEmpty;
  }

  int get size {
    return _items.length;
  }
}

class Solution {

  List<int> inorderTraversal(TreeNode? root) {
    final result = List<int>.empty(growable: true);
    final stack = Stack<TreeNode>();

    while (root != null || !stack.isEmpty) {
      while (root != null) {
        stack.push(root);
        root = root.left;
      }
      root = stack.pop();

      result.add(root.val);

      root = root.right;
    }

    return result;
  }
}
