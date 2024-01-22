package g0001_0100.s0062_unique_paths

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Math
// #Combinatorics #Algorithm_II_Day_13_Dynamic_Programming #Dynamic_Programming_I_Day_15
// #Level_1_Day_11_Dynamic_Programming #Big_O_Time_O(m*n)_Space_O(m*n)
// #2023_10_31_Time_405_ms_(70.18%)_Space_52.2_MB_(42.11%)

object Solution {
    def uniquePaths(m: Int, n: Int): Int = {
        val dp = Array.ofDim[Int](m, n)

        for (i <- 0 until m) {
            dp(i)(0) = 1
        }

        for (j <- 0 until n) {
            dp(0)(j) = 1
        }

        for (i <- 1 until m) {
            for (j <- 1 until n) {
                dp(i)(j) = dp(i - 1)(j) + dp(i)(j - 1)
            }
        }

        dp(m - 1)(n - 1)
    }
}
