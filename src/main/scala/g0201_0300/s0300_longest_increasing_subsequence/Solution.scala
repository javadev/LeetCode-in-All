package g0201_0300.s0300_longest_increasing_subsequence

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Binary_Search #Algorithm_II_Day_16_Dynamic_Programming #Binary_Search_II_Day_3
// #Dynamic_Programming_I_Day_18 #Udemy_Dynamic_Programming #Big_O_Time_O(n*log_n)_Space_O(n)
// #2023_11_08_Time_522_ms_(88.89%)_Space_55.5_MB_(88.89%)

object Solution {
    def lengthOfLIS(nums: Array[Int]): Int = {
        if (nums == null || nums.isEmpty) {
            return 0
        }

        val dp = Array.fill(nums.length + 1)(Int.MaxValue)
        val left = 1
        var right = 1

        for (curr <- nums) {
            var start = left
            var end = right

            while (start + 1 < end) {
                val mid = start + (end - start) / 2
                if (dp(mid) > curr) {
                    end = mid
                } else {
                    start = mid
                }
            }

            if (dp(start) > curr) {
                dp(start) = curr
            } else if (curr > dp(start) && curr < dp(end)) {
                dp(end) = curr
            } else if (curr > dp(end)) {
                dp(end + 1) = curr
                right += 1
            }
        }

        right
    }
}
