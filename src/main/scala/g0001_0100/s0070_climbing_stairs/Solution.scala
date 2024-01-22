package g0001_0100.s0070_climbing_stairs

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Dynamic_Programming #Math #Memoization
// #Algorithm_I_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_2
// #Level_1_Day_10_Dynamic_Programming #Udemy_Dynamic_Programming #Big_O_Time_O(n)_Space_O(n)
// #2023_11_02_Time_369_ms_(98.32%)_Space_52_MB_(32.77%)

object Solution {
    def climbStairs(n: Int): Int = {
        if (n < 2) {
            return n
        }
        val cache = new Array[Int](n)

        // Initialize the cache for the first two steps
        cache(0) = 1
        cache(1) = 2

        // Fill in the cache using a loop
        for (i <- 2 until n) {
            cache(i) = cache(i - 1) + cache(i - 2)
        }

        cache(n - 1)
    }
}
