// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Depth_First_Search
// #Breadth_First_Search #Matrix #Union_Find
// #Algorithm_II_Day_6_Breadth_First_Search_Depth_First_Search
// #Graph_Theory_I_Day_1_Matrix_Related_Problems #Level_1_Day_9_Graph/BFS/DFS #Udemy_Graph
// #Top_Interview_150_Graph_General #Big_O_Time_O(M*N)_Space_O(M*N)
// #2024_10_08_Time_331_ms_(89.19%)_Space_152.8_MB_(72.97%)

class Solution {
  int numIslands(List<List<String>> grid) {
    if (grid.isEmpty) return 0;

    int rows = grid.length;
    int cols = grid[0].length;
    int count = 0;

    void dfs(int row, int col) {
      if (row < 0 || row >= rows || col < 0 || col >= cols || grid[row][col] == '0') {
        return;
      }

      grid[row][col] = '0';
      dfs(row + 1, col);
      dfs(row - 1, col);
      dfs(row, col + 1);
      dfs(row, col - 1);
    }

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (grid[i][j] == '1') {
          count++;
          dfs(i, j);
        }
      }
    }

    return count;
  }
}
