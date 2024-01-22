package g0001_0100.s0005_longest_palindromic_substring

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
// #Data_Structure_II_Day_9_String #Algorithm_II_Day_14_Dynamic_Programming
// #Dynamic_Programming_I_Day_17 #Udemy_Strings #Big_O_Time_O(n)_Space_O(n)
// #2023_10_29_Time_502_ms_(87.65%)_Space_54.1_MB_(100.00%)

object Solution {
    def longestPalindrome(s: String): String = {
        val newStr = new Array[Char](s.length * 2 + 1)
        newStr(0) = '#'
        for (i <- 0 until s.length) {
            newStr(2 * i + 1) = s.charAt(i)
            newStr(2 * i + 2) = '#'
        }

        val dp = new Array[Int](newStr.length)
        var friendCenter = 0
        var friendRadius = 0
        var lpsCenter = 0
        var lpsRadius = 0

        for (i <- 0 until newStr.length) {
            dp(i) =
                if (friendCenter + friendRadius > i)
                    Math.min(dp(friendCenter * 2 - i), (friendCenter + friendRadius) - i)
                else
                    1

            while (i + dp(i) < newStr.length
                && i - dp(i) >= 0
                && newStr(i + dp(i)) == newStr(i - dp(i))) {
                dp(i) += 1
            }

            if (friendCenter + friendRadius < i + dp(i)) {
                friendCenter = i
                friendRadius = dp(i)
            }

            if (lpsRadius < dp(i)) {
                lpsCenter = i
                lpsRadius = dp(i)
            }
        }

        s.substring((lpsCenter - lpsRadius + 1) / 2, (lpsCenter + lpsRadius - 1) / 2)
    }
}
