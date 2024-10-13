// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search
// #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_11 #Level_2_Day_8_Binary_Search
// #Udemy_Binary_Search #Big_O_Time_O(log_n)_Space_O(1)
// #2024_10_01_Time_317_ms_(91.14%)_Space_153.9_MB_(7.60%)

class Solution {
  int search(List<int> nums, int target) {
    int mid;
    int lo = 0;
    int hi = nums.length - 1;

    while (lo <= hi) {
      mid = ((hi - lo) >> 1) + lo;

      if (target == nums[mid]) {
        return mid;
      }

      // Check if the left half is sorted
      if (nums[lo] <= nums[mid]) {
        // Check if the target is within the sorted left half
        if (nums[lo] <= target && target <= nums[mid]) {
          hi = mid - 1;
        } else {
          lo = mid + 1;
        }
      }
      // Otherwise, the right half is sorted
      else {
        // Check if the target is within the sorted right half
        if (nums[mid] <= target && target <= nums[hi]) {
          lo = mid + 1;
        } else {
          hi = mid - 1;
        }
      }
    }

    return -1;
  }
}
