package g0001_0100.s0032_longest_valid_parentheses

// #Hard #Top_100_Liked_Questions #String #Dynamic_Programming #Stack #Big_O_Time_O(n)_Space_O(1)
// #2023_10_30_Time_444_ms_(87.50%)_Space_54.7_MB_(87.50%)

object Solution {
    @SuppressWarnings(Array("scala:S3776"))
    def longestValidParentheses(s: String): Int = {
        var max = 0
        var left = 0
        var right = 0
        val n = s.length

        for (i <- 0 until n) {
            val ch = s.charAt(i)
            if (ch == '(') {
                left += 1
            } else {
                right += 1
            }
            if (right > left) {
                left = 0
                right = 0
            }
            if (left == right) {
                max = math.max(max, left + right)
            }
        }

        left = 0
        right = 0
        for (i <- n - 1 to 0 by -1) {
            val ch = s.charAt(i)
            if (ch == '(') {
                left += 1
            } else {
                right += 1
            }
            if (left > right) {
                left = 0
                right = 0
            }
            if (left == right) {
                max = math.max(max, left + right)
            }
        }

        max
    }
}
