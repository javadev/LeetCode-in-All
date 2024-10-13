// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Udemy_Arrays
// #Big_O_Time_O(n)_Space_O(n) #2024_10_04_Time_355_ms_(85.19%)_Space_167.8_MB_(51.85%)

class Solution {
  int firstMissingPositive(List<int> nums) {
    int i = 0, n = nums.length;

    while (i < n) {
      int j = nums[i] - 1;
      if (0 <= j && j < n && nums[i] != nums[j]) {
        // swap
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
      } else {
        i++;
      }
    }

    for (int i = 0; i < n; i++) {
      if (nums[i] != i + 1) {
        return i + 1;
      }
    }

    return n + 1;
  }
}
