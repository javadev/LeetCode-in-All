package g0001_0100.s0033_search_in_rotated_sorted_array

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search
// #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_11 #Level_2_Day_8_Binary_Search
// #Udemy_Binary_Search #Big_O_Time_O(log_n)_Space_O(1)
// #2023_10_30_Time_453_ms_(91.53%)_Space_54.9_MB_(49.15%)

object Solution {
    def search(nums: Array[Int], target: Int): Int = {
        var lo = 0
        var hi = nums.length - 1
        while (lo <= hi) {
            val mid = (hi - lo) / 2 + lo
            if (target == nums(mid)) {
                return mid
            }
            if (nums(lo) <= nums(mid)) {
                if (nums(lo) <= target && target <= nums(mid)) {
                    hi = mid - 1
                } else {
                    lo = mid + 1
                }
            } else if (nums(mid) <= target && target <= nums(hi)) {
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }
        -1
    }
}
