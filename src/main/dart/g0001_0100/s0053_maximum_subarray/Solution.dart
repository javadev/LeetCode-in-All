// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Divide_and_Conquer #Data_Structure_I_Day_1_Array #Dynamic_Programming_I_Day_5
// #Udemy_Famous_Algorithm #Big_O_Time_O(n)_Space_O(1)
// #2024_10_04_Time_361_ms_(88.89%)_Space_182.4_MB_(7.41%)

class Solution {
  int maxSubArray(List<int> nums) {
    int maxi = -1 << 31; // Equivalent to Integer.MIN_VALUE
    int sum = 0;

    for (int num in nums) {
      // calculating sub-array sum
      sum += num;
      maxi = sum > maxi ? sum : maxi;

      if (sum < 0) {
        // reset sum to 0 if it's negative
        sum = 0;
      }
    }

    return maxi;
  }
}
