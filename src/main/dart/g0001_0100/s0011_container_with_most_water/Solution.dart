// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Greedy #Two_Pointers
// #Algorithm_II_Day_4_Two_Pointers #Big_O_Time_O(n)_Space_O(1)
// #2024_09_30_Time_337_ms_(96.77%)_Space_172.5_MB_(64.52%)

import 'dart:math';

class Solution {
  int maxArea(List<int> height) {
    int maxArea = -1;
    int left = 0;
    int right = height.length - 1;

    while (left < right) {
      if (height[left] < height[right]) {
        maxArea = max(maxArea, height[left] * (right - left));
        left++;
      } else {
        maxArea = max(maxArea, height[right] * (right - left));
        right--;
      }
    }

    return maxArea;
  }
}
