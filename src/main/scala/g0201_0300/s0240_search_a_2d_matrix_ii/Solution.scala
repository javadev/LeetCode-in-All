package g0201_0300.s0240_search_a_2d_matrix_ii

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search #Matrix
// #Divide_and_Conquer #Data_Structure_II_Day_4_Array #Binary_Search_II_Day_8
// #Big_O_Time_O(n+m)_Space_O(1) #2023_11_07_Time_579_ms_(66.67%)_Space_65.2_MB_(33.33%)

object Solution {
    def searchMatrix(matrix: Array[Array[Int]], target: Int): Boolean = {
        var r = 0
        var c = matrix(0).length - 1

        while (r < matrix.length && c >= 0) {
            if (matrix(r)(c) == target) {
                return true
            } else if (matrix(r)(c) > target) {
                c -= 1
            } else {
                r += 1
            }
        }

        false
    }
}
