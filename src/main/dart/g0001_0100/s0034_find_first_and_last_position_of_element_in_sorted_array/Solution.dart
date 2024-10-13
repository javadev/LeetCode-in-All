// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search
// #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_5 #Big_O_Time_O(log_n)_Space_O(1)
// #2024_10_01_Time_321_ms_(92.86%)_Space_150.3_MB_(48.57%)

class Solution {
  List<int> searchRange(List<int> nums, int target) {
    int? firstIndex = null;
    int? secondIndex = null;
    for (int i = 0; i < nums.length; i++) {
      if (firstIndex == null && nums[i] == target) {
        firstIndex = i;
      }
      if (firstIndex != null && nums[i] == target) {
        secondIndex = i;
      }
    }
    return [firstIndex ?? -1, secondIndex ?? -1];
  }
}
