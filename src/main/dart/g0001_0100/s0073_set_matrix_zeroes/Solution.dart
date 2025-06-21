// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Matrix
// #Udemy_2D_Arrays/Matrix #Top_Interview_150_Matrix #Big_O_Time_O(m*n)_Space_O(1)
// #2024_10_05_Time_350_ms_(91.30%)_Space_152.1_MB_(47.83%)

class Solution {
  void setZeroes(List<List<int>> matrix) {
    int nRow = matrix.length;
    int nCol = matrix.first.length;
    bool fr = false;
    bool lr = false;
    bool fc = false;
    bool lc = false;

    for (int i = 0; i < nCol; i++) {
      if (matrix[0][i] == 0) {
        fr = true;
      }
      if (matrix[nRow - 1][i] == 0) {
        lr = true;
      }
    }

    for (int i = 0; i < nRow; i++) {
      if (matrix[i][0] == 0) {
        fc = true;
      }
      if (matrix[i][nCol - 1] == 0) {
        lc = true;
      }
    }

    for (int i = 1; i < nRow - 1; i++) {
      for (int j = 1; j < nCol - 1; j++) {
        if (matrix[i][j] == 0) {
          matrix[0][j] = 0;
          matrix[i][0] = 0;
        }
      }
    }

    for (int i = 1; i < nRow - 1; i++) {
      if (matrix[i][0] == 0 || matrix[i][nCol - 1] == 0) {
        for (int j = 0; j < nCol; j++) {
          matrix[i][j] = 0;
        }
      }
    }

    for (int i = 1; i < nCol - 1; i++) {
      if (matrix[0][i] == 0 || matrix[nRow - 1][i] == 0) {
        for (int j = 0; j < nRow; j++) {
          matrix[j][i] = 0;
        }
      }
    }


    if (fr) {
      for (int i = 0; i < nCol; i++) {
        matrix[0][i] = 0;
      }
    }
    if (lr) {
      for (int i = 0; i < nCol; i++) {
        matrix[nRow - 1][i] = 0;
      }
    }
    if (fc) {
      for (int i = 0; i < nRow; i++) {
        matrix[i][0] = 0;
      }
    }
    if (lc) {
      for (int i = 0; i < nRow; i++) {
        matrix[i][nCol - 1] = 0;
      }
    }
  }
}
