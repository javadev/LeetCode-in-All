// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Algorithm_I_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_3
// #Level_2_Day_12_Dynamic_Programming #Udemy_Dynamic_Programming #Big_O_Time_O(n)_Space_O(n)
// #2024_10_08_Time_306_ms_(77.50%)_Space_151.8_MB_(15.00%)

class Solution {
  int rob(List<int> nums) {
    // The best you can do at any given house is
    // the value of this hosue + maximum values of
    // what you could get at every house that is
    // two away from this one.

    // Expressed as pesudocode
    // dp[i] = i + max(dp[i-2] ..... dp[0])

    List<int> dp = List<int>.filled(nums.length, 0);
    int maxValue = 0;
    for (int i = 0; i < nums.length; i++) {
      // i is the index we are filling the table for
      // Look back at every dp before this.
      // Start with the value of this house
      int value = nums[i];
      dp[i] = value;
      for (int j = 0; j < i - 1; j++) {
        dp[i] = max(dp[i], value + dp[j]);
      }
      maxValue = max(maxValue, dp[i]);
    }
    return maxValue;
  }
}
