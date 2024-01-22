package g0001_0100.s0064_minimum_path_sum

// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Matrix
// #Dynamic_Programming_I_Day_16 #Udemy_Dynamic_Programming #Big_O_Time_O(m*n)_Space_O(m*n)
// #2023_11_02_Time_521_ms_(92.86%)_Space_59.9_MB_(21.43%)

object Solution {
    def minPathSum(grid: Array[Array[Int]]): Int = {
        val numRows = grid.length
        val numCols = grid(0).length
        val dp = Array.ofDim[Int](numRows, numCols)

        for (r <- numRows - 1 to 0 by -1) {
            for (c <- numCols - 1 to 0 by -1) {
                if (r == numRows - 1 && c == numCols - 1) {
                    dp(r)(c) = grid(r)(c)
                } else if (r == numRows - 1) {
                    dp(r)(c) = grid(r)(c) + dp(r)(c + 1)
                } else if (c == numCols - 1) {
                    dp(r)(c) = grid(r)(c) + dp(r + 1)(c)
                } else {
                    dp(r)(c) = grid(r)(c) + Math.min(dp(r + 1)(c), dp(r)(c + 1))
                }
            }
        }
        dp(0)(0)
    }
}
