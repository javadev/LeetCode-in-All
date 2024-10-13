// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Matrix #Backtracking
// #Algorithm_II_Day_11_Recursion_Backtracking #Big_O_Time_O(4^(m*n))_Space_O(m*n)
// #2024_10_06_Time_523_ms_(88.46%)_Space_147.3_MB_(92.31%)

class Solution {
  bool backtrace(List<List<String>> board, List<List<bool>> visited,
      String word, int index, int x, int y) {
    if (index == word.length) {
      return true;
    }
    if (x < 0 || x >= board.length || y < 0 || y >= board[0].length ||
        visited[x][y]) {
      return false;
    }
    visited[x][y] = true;

    if (word[index] == board[x][y]) {
      bool res =
          backtrace(board, visited, word, index + 1, x, y + 1) ||
              backtrace(board, visited, word, index + 1, x, y - 1) ||
              backtrace(board, visited, word, index + 1, x + 1, y) ||
              backtrace(board, visited, word, index + 1, x - 1, y);

      if (!res) {
        visited[x][y] = false;
      }
      return res;
    } else {
      visited[x][y] = false;
      return false;
    }
  }

  bool exist(List<List<String>> board, String word) {
    List<List<bool>> visited = List.generate(
        board.length, (_) => List.filled(board[0].length, false));

    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        if (backtrace(board, visited, word, 0, i, j)) {
          return true;
        }
      }
    }
    return false;
  }
}
