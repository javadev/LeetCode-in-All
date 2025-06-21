// #Medium #Top_100_Liked_Questions #Array #Binary_Search #Algorithm_II_Day_2_Binary_Search
// #Binary_Search_I_Day_12 #Udemy_Binary_Search #Top_Interview_150_Binary_Search
// #Big_O_Time_O(log_N)_Space_O(log_N) #2024_10_07_Time_313_ms_(92.98%)_Space_149.8_MB_(42.10%)

class Solution {
  int findMinUtil(List<int> nums, int l, int r) {
    if (l == r) {
      return nums[l];
    }
    int mid = (l + r) ~/ 2; // Use integer division

    if (mid == l && nums[mid] < nums[r]) {
      return nums[l];
    }
    if (mid - 1 >= 0 && nums[mid - 1] > nums[mid]) {
      return nums[mid];
    }
    if (nums[mid] < nums[l]) {
      return findMinUtil(nums, l, mid - 1);
    } else if (nums[mid] > nums[r]) {
      return findMinUtil(nums, mid + 1, r);
    }
    return findMinUtil(nums, l, mid - 1);
  }

  int findMin(List<int> nums) {
    int l = 0;
    int r = nums.length - 1;
    return findMinUtil(nums, l, r);
  }
}
