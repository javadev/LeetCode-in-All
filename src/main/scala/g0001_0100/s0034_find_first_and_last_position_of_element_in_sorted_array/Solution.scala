package g0001_0100.s0034_find_first_and_last_position_of_element_in_sorted_array

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search
// #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_5 #Big_O_Time_O(log_n)_Space_O(1)
// #2023_10_30_Time_478_ms_(97.85%)_Space_58.1_MB_(5.38%)

object Solution {
    def searchRange(nums: Array[Int], target: Int): Array[Int] = {
        val ans = new Array[Int](2)
        ans(0) = helper(nums, target, equals = false)
        ans(1) = helper(nums, target, equals = true)
        ans
    }

    private def helper(nums: Array[Int], target: Int, equals: Boolean): Int = {
        var l = 0
        var r = nums.length - 1
        var result = -1
        while (l <= r) {
            val mid = l + (r - l) / 2
            if (nums(mid) == target) {
                result = mid
            }
            if (nums(mid) < target || (nums(mid) == target && equals)) {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        result
    }
}
