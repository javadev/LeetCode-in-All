// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
// #Backtracking #Algorithm_II_Day_11_Recursion_Backtracking #Udemy_Backtracking/Recursion
// #Big_O_Time_O(2^n)_Space_O(n) #2024_10_01_Time_312_ms_(79.37%)_Space_150.6_MB_(25.40%)

class Solution {
  List<String> generateParenthesis(int n) {
    return parenthesis(n, n);
  }

  List<String> parenthesis(int left, int right) {
    if (left == 0 && right == 0) {
      return [""];
    }
    List<String> return_ls = [];
    if (left != 0) {
      List<String> l1 = parenthesis(left - 1, right);
      for (int i = 0; i < l1.length; ++i) {
        l1[i] = '(' + l1[i];
        return_ls.add(l1[i]);
      }
    }
    if (right != 0 && left < right) {
      List<String> r1 = parenthesis(left, right - 1);
      for (int i = 0; i < r1.length; ++i) {
        r1[i] = ')' + r1[i];
        return_ls.add(r1[i]);
      }
    }
    return return_ls;
  }
}
