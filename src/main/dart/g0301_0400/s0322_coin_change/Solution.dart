// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Breadth_First_Search
// #Algorithm_II_Day_18_Dynamic_Programming #Dynamic_Programming_I_Day_20
// #Level_2_Day_12_Dynamic_Programming #Top_Interview_150_1D_DP #Big_O_Time_O(m*n)_Space_O(amount)
// #2024_10_09_Time_322_ms_(100.00%)_Space_151.2_MB_(58.82%)

class Solution {
  int coinChange(List<int> coins, int amount) {
    List<int> dp = List.filled(amount + 1, 0);
    dp[0] = 1;

    for (int coin in coins) {
      for (int i = coin; i <= amount; i++) {
        int prev = dp[i - coin];
        if (prev > 0) {
          if (dp[i] == 0) {
            dp[i] = prev + 1;
          } else {
            dp[i] = (dp[i] < prev + 1) ? dp[i] : prev + 1;
          }
        }
      }
    }

    return dp[amount] > 0 ? dp[amount] - 1 : -1;
  }
}
