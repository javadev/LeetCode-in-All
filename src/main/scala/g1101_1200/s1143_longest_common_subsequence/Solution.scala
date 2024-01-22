package g1101_1200.s1143_longest_common_subsequence

// #Medium #Top_100_Liked_Questions #String #Dynamic_Programming
// #Algorithm_II_Day_17_Dynamic_Programming #Dynamic_Programming_I_Day_19
// #Udemy_Dynamic_Programming #Big_O_Time_O(n*m)_Space_O(n*m)
// #2023_11_09_Time_507_ms_(100.00%)_Space_62.6_MB_(41.67%)

object Solution {
    def longestCommonSubsequence(text1: String, text2: String): Int = {
        val n = text1.length
        val m = text2.length
        val dp = Array.ofDim[Int](n + 1, m + 1)

        for (i <- 1 to n) {
            for (j <- 1 to m) {
                if (text1(i - 1) == text2(j - 1)) {
                    dp(i)(j) = dp(i - 1)(j - 1) + 1
                } else {
                    dp(i)(j) = Math.max(dp(i - 1)(j), dp(i)(j - 1))
                }
            }
        }

        dp(n)(m)
    }
}
