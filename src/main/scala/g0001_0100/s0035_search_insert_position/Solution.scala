package g0001_0100.s0035_search_insert_position

// #Easy #Top_100_Liked_Questions #Array #Binary_Search #Algorithm_I_Day_1_Binary_Search
// #Binary_Search_I_Day_2 #Big_O_Time_O(log_n)_Space_O(1)
// #2023_10_30_Time_466_ms_(87.04%)_Space_55.1_MB_(35.19%)

object Solution {
    def searchInsert(nums: Array[Int], target: Int): Int = {
        var lo = 0
        var hi = nums.length - 1
        while (lo <= hi) {
            val mid = lo + (hi - lo) / 2
            if (target == nums(mid)) {
                return mid
            } else if (target < nums(mid)) {
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }
        lo
    }
}
