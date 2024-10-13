// #Medium #Array #Dynamic_Programming #Backtracking #Big_O_Time_O(n*(sum+s))_Space_O(n*(sum+s))
// #2024_10_12_Time_334_ms_(90.91%)_Space_154.2_MB_(27.27%)

class Solution {
  int findTargetSumWays(List<int> nums, int s) {
    int sum = nums.reduce((a, b) => a + b);
    s = s.abs();

    // Invalid s, return 0
    if (s > sum || (sum + s) % 2 != 0) {
      return 0;
    }

    int target = (sum + s) ~/ 2;
    List<List<int>> dp = List.generate(target + 1, (i) => List.filled(nums.length + 1, 0));

    dp[0][0] = 1;

    // Handle the case of empty knapsack
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == 0) {
        dp[0][i + 1] = dp[0][i] * 2;
      } else {
        dp[0][i + 1] = dp[0][i];
      }
    }

    for (int i = 1; i <= target; i++) {
      for (int j = 0; j < nums.length; j++) {
        dp[i][j + 1] += dp[i][j];
        if (nums[j] <= i) {
          dp[i][j + 1] += dp[i - nums[j]][j];
        }
      }
    }

    return dp[target][nums.length];
  }
}
