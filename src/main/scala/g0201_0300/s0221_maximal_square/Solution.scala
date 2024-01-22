package g0201_0300.s0221_maximal_square

// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Matrix
// #Dynamic_Programming_I_Day_16 #Big_O_Time_O(m*n)_Space_O(m*n)
// #2023_11_07_Time_626_ms_(100.00%)_Space_65.3_MB_(100.00%)

object Solution {
    def maximalSquare(matrix: Array[Array[Char]]): Int = {
        val m = matrix.length
        if (m == 0) {
            return 0
        }
        val n = matrix(0).length
        if (n == 0) {
            return 0
        }

        val dp = Array.ofDim[Int](m + 1, n + 1)
        var max = 0

        for (i <- 0 until m) {
            for (j <- 0 until n) {
                if (matrix(i)(j) == '1') {
                    val next = 1 + Math.min(dp(i)(j), Math.min(dp(i + 1)(j), dp(i)(j + 1)))
                    if (next > max) {
                        max = next
                    }
                    dp(i + 1)(j + 1) = next
                }
            }
        }

        max * max
    }
}
