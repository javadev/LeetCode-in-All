package g0001_0100.s0072_edit_distance

// #Hard #Top_100_Liked_Questions #String #Dynamic_Programming
// #Algorithm_II_Day_18_Dynamic_Programming #Dynamic_Programming_I_Day_19
// #Udemy_Dynamic_Programming #Big_O_Time_O(n^2)_Space_O(n2)
// #2023_11_02_Time_487_ms_(100.00%)_Space_55.3_MB_(100.00%)

object Solution {
    def minDistance(w1: String, w2: String): Int = {
        val n1 = w1.length
        val n2 = w2.length

        if (n2 > n1) {
            return minDistance(w2, w1)
        }

        val dp = Array.range(0, n2 + 1)

        for (j <- 0 to n2) {
            dp(j) = j
        }

        for (i <- 1 to n1) {
            var pre = dp(0)
            dp(0) = i

            for (j <- 1 to n2) {
                val tmp = dp(j)
                dp(j) =
                    if (w1(i - 1) != w2(j - 1))
                        1 + Math.min(pre, Math.min(dp(j), dp(j - 1)))
                    else
                        pre
                pre = tmp
            }
        }

        dp(n2)
    }
}
