package g0001_0100.s0041_first_missing_positive

// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Udemy_Arrays
// #Big_O_Time_O(n)_Space_O(n) #2023_10_30_Time_650_ms_(100.00%)_Space_78.5_MB_(100.00%)

import scala.annotation.tailrec

object Solution {
    def firstMissingPositive(nums: Array[Int]): Int = {
        for (i <- nums.indices) {
            if (nums(i) <= 0 || nums(i) > nums.length || nums(i) == i + 1) {
                // Continue the loop
            } else {
                dfs(nums, nums(i))
            }
        }

        for (i <- nums.indices) {
            if (nums(i) != i + 1) {
                return i + 1
            }
        }

        nums.length + 1
    }

    @tailrec
    private def dfs(nums: Array[Int], value: Int): Unit = {
        if (value <= 0 || value > nums.length || value == nums(value - 1)) {
            return
        }
        val temp = nums(value - 1)
        nums(value - 1) = value
        dfs(nums, temp)
    }
}
