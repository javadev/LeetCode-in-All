// #Hard #Top_100_Liked_Questions #Array #Backtracking #Big_O_Time_O(N!)_Space_O(N)
// #2024_10_04_Time_328_ms_(86.67%)_Space_149.1_MB_(73.33%)

class Solution {
  List<List<String>> solveNQueens(int n) {
    final List<List<String>> board = List.generate(n, (_) => List<String>.filled(n, '.'));
    final List<List<String>> ans = [];
    backtrack(board, ans, 0, 0, n);
    return ans;
  }

  bool isSafe(List<List<String>> board, int row, int col) {
    for (int i = 0; i < row; i++) {
      if (board[i][col] == 'Q') {
        return false;
      }
    }

    for (int i = row, j = col; i >= 0 && j >= 0; i--, j--) {
      if (board[i][j] == 'Q') {
        return false;
      }
    }

    for (int i = row, j = col; i >= 0 && j < board.length; i--, j++) {
      if (board[i][j] == 'Q') {
        return false;
      }
    }

    return true;
  }

  void backtrack(List<List<String>> board, List<List<String>> ans, int row, int col, int queens) {
    if (row == queens) {
      ans.add(convert(board));
      return;
    }

    for (int col = 0; col < board.length; col++) {
      if (isSafe(board, row, col)) {
        board[row][col] = 'Q';
        backtrack(board, ans, row + 1, col, queens);
        board[row][col] = '.';
      }
    }
  }

  List<String> convert(List<List<String>> board) {
    final List<String> ans = [];
    for (int i = 0; i < board.length; i++) {
      final row = board[i].join('');
      ans.add(row);
    }

    return ans;
  }
}
