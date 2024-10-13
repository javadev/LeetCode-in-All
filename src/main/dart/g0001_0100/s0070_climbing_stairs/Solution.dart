// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Math #Memoization
// #Algorithm_I_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_2
// #Level_1_Day_10_Dynamic_Programming #Udemy_Dynamic_Programming #Big_O_Time_O(n)_Space_O(n)
// #2024_10_05_Time_301_ms_(81.01%)_Space_152.5_MB_(5.06%)

class Solution {
  int climbStairs(int n) {
    if (n < 2) {
      return n;
    }

    List<int> cache = List.filled(n, 0);

    // Initialize the base cases for 0 and 1 steps
    cache[0] = 1;
    cache[1] = 2;

    // Fill the cache with results for each step
    for (int i = 2; i < n; i++) {
      cache[i] = cache[i - 1] + cache[i - 2];
    }

    return cache[n - 1];
  }
}
