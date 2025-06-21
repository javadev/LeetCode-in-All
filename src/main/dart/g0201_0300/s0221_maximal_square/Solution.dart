// #Medium #Array #Dynamic_Programming #Matrix #Dynamic_Programming_I_Day_16
// #Top_Interview_150_Multidimensional_DP #Big_O_Time_O(m*n)_Space_O(m*n)
// #2024_10_08_Time_367_ms_(72.73%)_Space_169.4_MB_(36.36%)

import 'dart:math';

class Solution {
  int maximalSquare(List<List<String>> matrix) {
    final m = matrix.length;
    final n = matrix.first.length;
    final List<List<int>> dp = List.generate(m, (_) => List.filled(n, 0));

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (matrix[i][j] == '1') {
          if (i == 0 || j == 0) {
            dp[i][j] = 1;
          } else {
            dp[i][j] = min(dp[i - 1][j], min(dp[i][j - 1], dp[i - 1][j - 1])) + 1;
          }
        }
      }
    }

    final maxi = dp.map((nums) => nums.reduce(max)).reduce(max);

    return maxi * maxi;
  }
}
