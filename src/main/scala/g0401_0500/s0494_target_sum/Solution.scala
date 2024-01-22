package g0401_0500.s0494_target_sum

// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Backtracking
// #Big_O_Time_O(n*(sum+s))_Space_O(n*(sum+s))
// #2023_11_09_Time_494_ms_(100.00%)_Space_55.2_MB_(33.33%)

object Solution {
    def findTargetSumWays(nums: Array[Int], s: Int): Int = {
        val sum = nums.sum
        val absS = Math.abs(s)

        if (absS > sum || (sum + absS) % 2 != 0) {
            return 0
        }

        val target = (sum + absS) / 2
        val dp = Array.ofDim[Int](target + 1, nums.length + 1)

        dp(0)(0) = 1

        for (i <- nums.indices) {
            if (nums(i) == 0) {
                dp(0)(i + 1) = dp(0)(i) * 2
            } else {
                dp(0)(i + 1) = dp(0)(i)
            }
        }

        for (i <- 1 to target) {
            for (j <- nums.indices) {
                dp(i)(j + 1) = dp(i)(j)
                if (nums(j) <= i) {
                    dp(i)(j + 1) += dp(i - nums(j))(j)
                }
            }
        }

        dp(target)(nums.length)
    }
}
