// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Two_Pointers
// #Data_Structure_II_Day_2_Array #Udemy_Arrays #Big_O_Time_O(n)_Space_O(1)
// #2024_10_05_Time_314_ms_(79.31%)_Space_147.9_MB_(77.01%)

class Solution {
  void sortColors(List<int> nums) {
    int zeroes = 0;
    int ones = 0;

    // First pass to count and arrange zeros and count ones
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == 0) {
        nums[zeroes++] = 0;
      } else if (nums[i] == 1) {
        ones++;
      }
    }

    // Second pass to place ones after zeroes
    for (int j = zeroes; j < zeroes + ones; j++) {
      nums[j] = 1;
    }

    // Third pass to place twos after ones
    for (int k = zeroes + ones; k < nums.length; k++) {
      nums[k] = 2;
    }
  }
}
