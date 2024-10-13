// #Medium #Top_100_Liked_Questions #Array #Two_Pointers #Big_O_Time_O(n)_Space_O(1)
// #2024_10_03_Time_315_ms_(94.12%)_Space_148.7_MB_(47.06%)

class Solution {
  void nextPermutation(List<int> nums) {
    if (nums.length <= 1) {
      return;
    }
    int i = nums.length - 2;

    // Find the first index `i` where nums[i] < nums[i + 1]
    while (i >= 0 && nums[i] >= nums[i + 1]) {
      i--;
    }

    // If such an index exists, find the next larger element to swap with
    if (i >= 0) {
      int j = nums.length - 1;
      while (nums[j] <= nums[i]) {
        j--;
      }
      _swap(nums, i, j);
    }

    // Reverse the part of the array after index `i`
    _reverse(nums, i + 1, nums.length - 1);
  }

  // Helper function to swap two elements in the array
  void _swap(List<int> nums, int i, int j) {
    int temp = nums[i];
    nums[i] = nums[j];
    nums[j] = temp;
  }

  // Helper function to reverse the elements of the array between indices i and j
  void _reverse(List<int> nums, int i, int j) {
    while (i < j) {
      _swap(nums, i++, j--);
    }
  }
}
