// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Union_Find
// #Big_O_Time_O(N_log_N)_Space_O(1) #2024_10_07_Time_420_ms_(84.85%)_Space_163.6_MB_(90.91%)

class Solution {
  int longestConsecutive(List<int> nums) {
    if (nums.isEmpty) {
      return 0;
    }

    nums.sort(); // Sort the list
    int max = -999999999; // Equivalent to Integer.MIN_VALUE in Java
    int currentMax = 1;

    for (int i = 0; i < nums.length - 1; i++) {
      if (nums[i + 1] == nums[i] + 1) {
        currentMax += 1;
        continue;
      }
      if (nums[i + 1] == nums[i]) {
        continue;
      }
      // Start of a new sequence
      max = maxVal(max, currentMax);
      currentMax = 1;
    }

    return maxVal(max, currentMax);
  }

  int maxVal(int a, int b) => a > b ? a : b; // Utility function for max
}
