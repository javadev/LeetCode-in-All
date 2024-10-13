// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Data_Structure_I_Day_3_Array #Dynamic_Programming_I_Day_7 #Level_1_Day_5_Greedy #Udemy_Arrays
// #Big_O_Time_O(N)_Space_O(1) #2024_10_07_Time_374_ms_(89.33%)_Space_190.1_MB_(48.33%)

import 'dart:math';

class Solution {
  int maxProfit(List<int> prices) {
    int maxProfit = 0;
    int min = prices[0];

    for (int i = 1; i < prices.length; i++) {
      if (prices[i] > min) {
        maxProfit = max(maxProfit, prices[i] - min);
      } else {
        min = prices[i];
      }
    }

    return maxProfit;
  }
}
