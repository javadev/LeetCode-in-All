// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Math #Matrix
// #Data_Structure_II_Day_3_Array #Programming_Skills_II_Day_7 #Udemy_2D_Arrays/Matrix
// #Top_Interview_150_Matrix #Big_O_Time_O(n^2)_Space_O(1)
// #2024_10_04_Time_311_ms_(90.24%)_Space_151.1_MB_(19.51%)

class Solution {
  void rotate(List<List<int>> matrix) {
    int n = matrix.length;

    for (int i = 0; i < n ~/ 2; i++) {
      for (int j = i; j < n - i - 1; j++) {
        List<List<int>> pos = [
          [i, j],
          [j, n - 1 - i],
          [n - 1 - i, n - 1 - j],
          [n - 1 - j, i]
        ];

        int t = matrix[pos[0][0]][pos[0][1]];
        for (int k = 1; k < pos.length; k++) {
          int temp = matrix[pos[k][0]][pos[k][1]];
          matrix[pos[k][0]][pos[k][1]] = t;
          t = temp;
        }
        matrix[pos[0][0]][pos[0][1]] = t;
      }
    }
  }
}
