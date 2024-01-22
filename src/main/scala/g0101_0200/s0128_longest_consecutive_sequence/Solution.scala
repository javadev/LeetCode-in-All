package g0101_0200.s0128_longest_consecutive_sequence

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Union_Find
// #Big_O_Time_O(N_log_N)_Space_O(1) #2023_11_04_Time_708_ms_(100.00%)_Space_71.7_MB_(94.55%)

import scala.util.Sorting.quickSort

object Solution {
    def longestConsecutive(nums: Array[Int]): Int = {
        if (nums.isEmpty) {
            return 0
        }

        quickSort(nums)
        var max = Int.MinValue
        var thisMax = 1

        for (i <- 0 until nums.length - 1) {
            if (nums(i + 1) == nums(i) + 1) {
                thisMax += 1
            } else if (nums(i + 1) != nums(i)) {
                max = Math.max(max, thisMax)
                thisMax = 1
            }
        }

        Math.max(max, thisMax)
    }
}
