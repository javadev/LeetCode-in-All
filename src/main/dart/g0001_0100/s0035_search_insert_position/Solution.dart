// #Easy #Top_100_Liked_Questions #Array #Binary_Search #Algorithm_I_Day_1_Binary_Search
// #Binary_Search_I_Day_2 #Big_O_Time_O(log_n)_Space_O(1)
// #2024_10_01_Time_325_ms_(80.73%)_Space_147.9_MB_(80.00%)

class Solution {
  int searchInsert(List<int> nums, int target) {
    int lo = 0;
    int hi = nums.length - 1;
    while (lo <= hi) {
      int mid = lo + (hi - lo) ~/ 2;
      if (target == nums[mid]) {
        return mid;
      } else if (target < nums[mid]) {
        hi = mid - 1;
      } else {
        lo = mid + 1;
      }
    }
    return lo;
  }
}
