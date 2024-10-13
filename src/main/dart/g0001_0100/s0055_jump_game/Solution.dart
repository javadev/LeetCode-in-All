// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming #Greedy
// #Algorithm_II_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_4 #Udemy_Arrays
// #Big_O_Time_O(n)_Space_O(1) #2024_10_04_Time_331_ms_(97.53%)_Space_154.7_MB_(69.14%)

import 'dart:math';

class Solution {
  bool canJump(List<int> nums) {
    int maxReach = 0;

    for (int i = 0; i < nums.length; i++) {
      if (i > maxReach) {
        return false;
      }
      maxReach = max(maxReach, i + nums[i]);
    }

    return true;
  }
}
