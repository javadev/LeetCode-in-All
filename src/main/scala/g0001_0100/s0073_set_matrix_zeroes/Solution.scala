package g0001_0100.s0073_set_matrix_zeroes

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Matrix
// #Udemy_2D_Arrays/Matrix #Big_O_Time_O(m*n)_Space_O(1)
// #2023_11_02_Time_557_ms_(90.91%)_Space_57.7_MB_(36.36%)

object Solution {
    @SuppressWarnings(Array("scala:S3776"))
    def setZeroes(matrix: Array[Array[Int]]): Unit = {
        val m = matrix.length
        val n = matrix(0).length
        var row0 = false
        var col0 = false

        // Check if the 0th column needs to be marked as all 0s in the future
        for (row <- matrix) {
            if (row(0) == 0) {
                col0 = true
            }
        }

        // Check if the 0th row needs to be marked as all 0s in the future
        for (i <- 0 until n) {
            if (matrix(0)(i) == 0) {
                row0 = true
            }
        }

        // Store the signals in the 0th row and column
        for (i <- 1 until m) {
            for (j <- 1 until n) {
                if (matrix(i)(j) == 0) {
                    matrix(i)(0) = 0
                    matrix(0)(j) = 0
                }
            }
        }

        // Mark 0 for all cells based on signals from the 0th row and 0th column
        for (i <- 1 until m) {
            for (j <- 1 until n) {
                if (matrix(i)(0) == 0 || matrix(0)(j) == 0) {
                    matrix(i)(j) = 0
                }
            }
        }

        // Set the 0th column
        for (i <- 0 until m) {
            if (col0) {
                matrix(i)(0) = 0
            }
        }

        // Set the 0th row
        for (i <- 0 until n) {
            if (row0) {
                matrix(0)(i) = 0
            }
        }
    }
}
