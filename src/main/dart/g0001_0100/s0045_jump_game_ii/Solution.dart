// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Greedy
// #Algorithm_II_Day_13_Dynamic_Programming #Dynamic_Programming_I_Day_4
// #Top_Interview_150_Array/String #Big_O_Time_O(n)_Space_O(1)
// #2024_10_04_Time_335_ms_(81.58%)_Space_148.6_MB_(76.32%)

import 'dart:math';

class Solution {
  int jump(List<int> nums) {
    int length = 0;
    int maxLength = 0;
    int minJump = 0;

    for (int i = 0; i < nums.length - 1; ++i) {
      length--;
      maxLength--;
      maxLength = max(maxLength, nums[i]);

      if (length <= 0) {
        length = maxLength;
        minJump++;
      }

      if (length >= nums.length - i - 1) {
        return minJump;
      }
    }

    return minJump;
  }
}
