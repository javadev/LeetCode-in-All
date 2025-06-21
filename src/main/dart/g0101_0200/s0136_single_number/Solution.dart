// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Bit_Manipulation
// #LeetCode_75_Bit_Manipulation #Data_Structure_II_Day_1_Array
// #Algorithm_I_Day_14_Bit_Manipulation #Udemy_Integers #Top_Interview_150_Bit_Manipulation
// #Big_O_Time_O(N)_Space_O(1) #2024_10_07_Time_286_ms_(100.00%)_Space_149.6_MB_(74.55%)

class Solution {
  int singleNumber(List<int> nums) {
    int res = 0;
    for (int num in nums) {
      res ^= num;
    }
    return res;
  }
}
