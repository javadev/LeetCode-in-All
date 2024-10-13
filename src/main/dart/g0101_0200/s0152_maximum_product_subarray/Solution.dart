// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Dynamic_Programming_I_Day_6 #Level_2_Day_13_Dynamic_Programming #Udemy_Dynamic_Programming
// #Big_O_Time_O(N)_Space_O(1) #2024_10_07_Time_347_ms_(81.82%)_Space_149.9_MB_(63.64%)

import 'dart:math';

class Solution {
  int maxProduct(List<int> nums) {
    /*
      m = max 
      l = left 
      r = right
      s = size
      */
    var m = nums.first;
    var l = 1;
    var r = 1;
    var s = nums.length;
    var last = s - 1;
    for (var i = 0; i < s; i++) {
      l *= nums[i];
      r *= nums[last - i];
      m = max(m, l);
      m = max(m, r);
      l = l == 0 ? 1 : l;
      r = r == 0 ? 1 : r;
    }
    return m;
  }
}
