// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Math #Two_Pointers
// #Algorithm_I_Day_2_Two_Pointers #Udemy_Arrays #Big_O_Time_O(n)_Space_O(1)
// #2024_10_08_Time_343_ms_(93.58%)_Space_160.6_MB_(19.27%)

class Solution {
  void reverse(List<int> nums, int l, int r) {
    while (l <= r) {
      int temp = nums[l];
      nums[l] = nums[r];
      nums[r] = temp;
      l++;
      r--;
    }
  }

  void rotate(List<int> nums, int k) {
    int n = nums.length;
    int t = n - (k % n);
    reverse(nums, 0, t - 1);
    reverse(nums, t, n - 1);
    reverse(nums, 0, n - 1);
  }
}
