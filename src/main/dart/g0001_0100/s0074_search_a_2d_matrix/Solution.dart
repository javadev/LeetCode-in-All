// #Medium #Top_100_Liked_Questions #Array #Binary_Search #Matrix #Data_Structure_I_Day_5_Array
// #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_8 #Level_2_Day_8_Binary_Search
// #Udemy_2D_Arrays/Matrix #Top_Interview_150_Binary_Search #Big_O_Time_O(endRow+endCol)_Space_O(1)
// #2024_10_05_Time_321_ms_(90.28%)_Space_148.8_MB_(90.28%)

class Solution {
  bool searchMatrix(List<List<int>> matrix, int target) {
    int endRow = matrix.length;
    int endCol = matrix[0].length;
    int targetRow = 0;
    bool result = false;

    // Find the target row where target might be located
    for (int i = 0; i < endRow; i++) {
      if (matrix[i][endCol - 1] >= target) {
        targetRow = i;
        break;
      }
    }

    // Search for the target in the identified row
    for (int i = 0; i < endCol; i++) {
      if (matrix[targetRow][i] == target) {
        result = true;
        break;
      }
    }

    return result;
  }
}
