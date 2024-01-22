package g0401_0500.s0416_partition_equal_subset_sum

// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Level_2_Day_13_Dynamic_Programming
// #Big_O_Time_O(n*sums)_Space_O(n*sums) #2023_11_08_Time_577_ms_(100.00%)_Space_55.6_MB_(100.00%)

object Solution {
    def canPartition(nums: Array[Int]): Boolean = {
        val sum = nums.sum
        if (sum % 2 == 1) {
            false
        } else {
            val targetSum = sum / 2
            val dp = Array.ofDim[Boolean](targetSum + 1)
            dp(0) = true

            for (num <- nums) {
                for (currentSum <- targetSum to num by -1) {
                    dp(currentSum) = dp(currentSum) || dp(currentSum - num)
                }
            }

            dp(targetSum)
        }
    }
}
