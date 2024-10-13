// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Level_2_Day_13_Dynamic_Programming
// #Big_O_Time_O(n*sums)_Space_O(n*sums) #2024_10_12_Time_381_ms_(90.91%)_Space_146.9_MB_(100.00%)

class Solution {
  bool canPartition(List<int> nums) {
    int sums = nums.reduce((a, b) => a + b);

    if (sums % 2 == 1) {
      return false;
    }

    sums ~/= 2; // Integer division
    List<bool> dp = List.filled(sums + 1, false);
    dp[0] = true;

    for (int num in nums) {
      for (int sum = sums; sum >= num; sum--) {
        dp[sum] = dp[sum] || dp[sum - num];
      }
    }

    return dp[sums];
  }
}
