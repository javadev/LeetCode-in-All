package g0001_0100.s0003_longest_substring_without_repeating_characters

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Hash_Table #Sliding_Window
// #Algorithm_I_Day_6_Sliding_Window #Level_2_Day_14_Sliding_Window/Two_Pointer #Udemy_Strings
// #Big_O_Time_O(n)_Space_O(1) #2023_10_17_Time_482_ms_(96.91%)_Space_55.1_MB_(89.18%)

object Solution {
    def lengthOfLongestSubstring(s: String): Int = {
        val lastIndices = Array.fill(256)(-1)
        var maxLen = 0
        var curLen = 0
        var start = 0
        for (i <- 0 until s.length) {
            val cur = s.charAt(i)
            if (lastIndices(cur) < start) {
                lastIndices(cur) = i
                curLen += 1
            } else {
                val lastIndex = lastIndices(cur)
                start = lastIndex + 1
                curLen = i - start + 1
                lastIndices(cur) = i
            }
            if (curLen > maxLen) {
                maxLen = curLen
            }
        }
        maxLen
    }
}
