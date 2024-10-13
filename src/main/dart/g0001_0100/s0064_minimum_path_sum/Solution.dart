// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Matrix
// #Dynamic_Programming_I_Day_16 #Udemy_Dynamic_Programming #Big_O_Time_O(m*n)_Space_O(m*n)
// #2024_10_05_Time_328_ms_(88.89%)_Space_147.4_MB_(100.00%)

class Solution {
  int minPathSum(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    List<int> pathSum = List.filled(n, 100000);
    pathSum[0] = 0;

    for (int y = 0; y < m; y++) {
      for (int x = 0; x < n; x++) {
        pathSum[x] =
            (x > 0 ? min(pathSum[x], pathSum[x - 1]) : pathSum[x]) + grid[y][x];
      }
    }
    return pathSum[n - 1];
  }
}

int min(int a, int b) {
  if (a < b) {
    return a;
  }
  return b;
}
