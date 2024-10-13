// #Medium #Top_100_Liked_Questions #String #Dynamic_Programming
// #Algorithm_II_Day_18_Dynamic_Programming #Dynamic_Programming_I_Day_19
// #Udemy_Dynamic_Programming #Big_O_Time_O(n^2)_Space_O(n2)
// #2024_10_05_Time_333_ms_(100.00%)_Space_147.5_MB_(100.00%)

class Solution {
  int minDistance(String w1, String w2) {
    int n1 = w1.length;
    int n2 = w2.length;

    // If w2 is longer, swap w1 and w2 to ensure w1 is the longer string
    if (n2 > n1) {
      return minDistance(w2, w1);
    }

    List<int> dp = List.filled(n2 + 1, 0);

    // Initialize the first row of the DP table
    for (int j = 0; j <= n2; j++) {
      dp[j] = j;
    }

    for (int i = 1; i <= n1; i++) {
      int pre = dp[0];
      dp[0] = i;
      for (int j = 1; j <= n2; j++) {
        int temp = dp[j];
        dp[j] = w1[i - 1] != w2[j - 1]
            ? 1 + [pre, dp[j], dp[j - 1]].reduce((a, b) => a < b ? a : b)
            : pre;
        pre = temp;
      }
    }

    return dp[n2];
  }
}
