// #Hard #Top_100_Liked_Questions #String #Dynamic_Programming #Stack #Big_O_Time_O(n)_Space_O(1)
// #2024_10_01_Time_305_ms_(97.06%)_Space_149_MB_(64.71%)

class Solution {
  int longestValidParentheses(String s) {
    int max = 0;
    int left = 0;
    int right = 0;
    int n = s.length;
    late String ch;

    // Left to right pass
    for (int i = 0; i < n; i++) {
      ch = s[i];
      if (ch == '(') {
        left++;
      } else {
        right++;
      }
      if (right > left) {
        left = 0;
        right = 0;
      }
      if (left == right) {
        max = max > (left + right) ? max : (left + right);
      }
    }

    left = 0;
    right = 0;

    // Right to left pass
    for (int i = n - 1; i >= 0; i--) {
      ch = s[i];
      if (ch == '(') {
        left++;
      } else {
        right++;
      }
      if (left > right) {
        left = 0;
        right = 0;
      }
      if (left == right) {
        max = max > (left + right) ? max : (left + right);
      }
    }

    return max;
  }
}
