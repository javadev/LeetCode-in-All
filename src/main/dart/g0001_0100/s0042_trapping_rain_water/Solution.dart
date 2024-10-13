// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming #Two_Pointers
// #Stack #Monotonic_Stack #Dynamic_Programming_I_Day_9 #Udemy_Two_Pointers
// #Big_O_Time_O(n)_Space_O(1) #2024_10_04_Time_328_ms_(80.77%)_Space_153.5_MB_(17.31%)

import 'dart:math';

class Solution {
  int trap(List<int> heigth) {
    int left = 0,
        right = heigth.length - 1,
        leftMax = 0,
        rightMax = 0,
        water = 0;

    while (left < right) {
      leftMax = max(leftMax, heigth[left]);
      rightMax = max(rightMax, heigth[right]);
      water += leftMax < rightMax
          ? leftMax - heigth[left++]
          : rightMax - heigth[right--];
    }

    return water;
  }
}
