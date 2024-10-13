// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
// #Backtracking #Big_O_Time_O(N*2^N)_Space_O(2^N*N)
// #2024_10_07_Time_377_ms_(100.00%)_Space_170.8_MB_(92.31%)

class Solution {
  List<List<String>> partition(String s) {
    // Time Complexity: O(n * 2^n)
    // Space Complexity: O(n^2)

    List<List<String>> result = [];
    List<String> path = [];

    bool isPalindrome(String s) {
      int left = 0, right = s.length - 1;
      while (left < right) {
        if (s[left] != s[right]) return false;
        left++;
        right--;
      }
      return true;
    }

    void backtrack(int start) {
      if (start == s.length) {
        result.add(List.from(path));
        return;
      }
      for (int end = start + 1; end <= s.length; end++) {
        String substr = s.substring(start, end);
        if (isPalindrome(substr)) {
          path.add(substr);
          backtrack(end);
          path.removeLast();
        }
      }
    }

    backtrack(0);
    return result;
  }
}
