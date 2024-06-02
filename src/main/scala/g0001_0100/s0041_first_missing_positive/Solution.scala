package g0001_0100.s0041_first_missing_positive

// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Udemy_Arrays
// #Big_O_Time_O(n)_Space_O(n) #2024_06_01_Time_912_ms_(84.21%)_Space_71.6_MB_(100.00%)

import scala.annotation.tailrec

object Solution {
    def firstMissingPositive(nums: Array[Int]): Int = {
        for (i <- nums.indices) {
            if (nums(i) > 0 && nums(i) < nums.length && nums(i) != i + 1) {
                dfs(nums, nums(i))
            }
        }

        var result = nums.length + 1
        var found = false
        for (i <- nums.indices if !found) {
            if (nums(i) != i + 1) {
                result = i + 1
                found = true
            }
        }

        result
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
