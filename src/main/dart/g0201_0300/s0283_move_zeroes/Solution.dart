// #Easy #Top_100_Liked_Questions #Array #Two_Pointers #LeetCode_75_Two_Pointers
// #Algorithm_I_Day_3_Two_Pointers #Programming_Skills_I_Day_6_Array #Udemy_Arrays
// #Big_O_Time_O(n)_Space_O(1) #2024_10_09_Time_344_ms_(93.12%)_Space_155.6_MB_(50.26%)

class Solution {
  void moveZeroes(List<int> nums) {
    int firstZero = 0;
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] != 0) {
        _swap(firstZero, i, nums);
        firstZero++;
      }
    }
  }

  void _swap(int index1, int index2, List<int> numbers) {
    int temp = numbers[index2];
    numbers[index2] = numbers[index1];
    numbers[index1] = temp;
  }
}
