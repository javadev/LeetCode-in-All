// #Medium #Dynamic_Programming #Math #Tree #Binary_Tree #Binary_Search_Tree
// #Dynamic_Programming_I_Day_11 #Big_O_Time_O(n)_Space_O(1)
// #2024_10_06_Time_312_ms_(100.00%)_Space_148.1_MB_(100.00%)

class Solution {
  int numTrees(int n) {
    int result = 1;
    for (int i = 0; i < n; i++) {
      result = result * (2 * n - i) ~/ (i + 1);
    }
    result ~/= (n + 1);
    return result;
  }
}
