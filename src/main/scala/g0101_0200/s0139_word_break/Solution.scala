package g0101_0200.s0139_word_break

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table
// #Dynamic_Programming #Trie #Memoization #Algorithm_II_Day_15_Dynamic_Programming
// #Dynamic_Programming_I_Day_9 #Udemy_Dynamic_Programming #Big_O_Time_O(M+max*N)_Space_O(M+N+max)
// #2023_11_04_Time_482_ms_(66.67%)_Space_57.5_MB_(6.67%)

object Solution {
    def wordBreak(s: String, wordDict: List[String]): Boolean = {
        val dp = (0 until s.length() + 1).map(_ => false).toBuffer
        dp(0) = true
        val wordSet = wordDict.toSet

        def loop(j: Int, end: Int): Int = {
            if (j < end && dp(j) && wordSet.contains(s.substring(j, end))) {
                dp(end) = true
                end
            }
            else if (j < end) loop(j + 1, end)
            else -1
        }

        for (i <- 1 until s.length() + 1) {
            loop(0, i)
        }
        dp.last
    }
}
