// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Binary_Search
// #Algorithm_II_Day_16_Dynamic_Programming #Binary_Search_II_Day_3 #Dynamic_Programming_I_Day_18
// #Udemy_Dynamic_Programming #Big_O_Time_O(n*log_n)_Space_O(n)
// #2024_10_09_Time_332_ms_(96.15%)_Space_147.1_MB_(100.00%)

class Solution {
  int lengthOfLIS(List<int> nums) {
    if (nums == null || nums.isEmpty) {
      return 0;
    }

    List<int> dp = List.filled(nums.length + 1, 0);
    // Prefill the dp table with a maximum value.
    for (int i = 1; i < dp.length; i++) {
      dp[i] = 1 << 31 - 1;
    }

    int left = 1;
    int right = 1;

    for (int curr in nums){
      int start = left;
      int end = right;

      // Binary search, find the position to update in dp
      while (start + 1 < end) {
        int mid = start + (end - start) ~/ 2;
        if (dp[mid] > curr) {
          end = mid;
        } else {
          start = mid;
        }
      }

      // Update the dp table
      if (dp[start] > curr) {
        dp[start] = curr;
      } else if (curr > dp[start] && curr < dp[end]) {
        dp[end] = curr;
      } else if (curr > dp[end]) {
        dp[++end] = curr;
        right++;
      }
    }

    return right;
  }
}
