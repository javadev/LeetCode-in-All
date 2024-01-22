package g0001_0100.s0074_search_a_2d_matrix

// #Medium #Top_100_Liked_Questions #Array #Binary_Search #Matrix #Data_Structure_I_Day_5_Array
// #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_8 #Level_2_Day_8_Binary_Search
// #Udemy_2D_Arrays/Matrix #Big_O_Time_O(endRow+endCol)_Space_O(1)
// #2023_11_02_Time_478_ms_(83.33%)_Space_55.4_MB_(29.17%)

object Solution {
    def searchMatrix(matrix: Array[Array[Int]], target: Int): Boolean = {
        var i = matrix.length - 1
        val n = matrix.last.length - 1
        var j = 0
        while (i >= 0 && j <= n) {
            if (matrix(i)(j) == target) return true
            else if (matrix(i)(j) > target) i -= 1
            else j += 1
        }
        false
    }
}
