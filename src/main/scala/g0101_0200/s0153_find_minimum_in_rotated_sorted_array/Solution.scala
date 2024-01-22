package g0101_0200.s0153_find_minimum_in_rotated_sorted_array

// #Medium #Top_100_Liked_Questions #Array #Binary_Search #Algorithm_II_Day_2_Binary_Search
// #Binary_Search_I_Day_12 #Udemy_Binary_Search #Big_O_Time_O(log_N)_Space_O(log_N)
// #2023_11_05_Time_457_ms_(78.79%)_Space_55.5_MB_(6.06%)

object Solution {
    def findMin(nums: Array[Int]): Int = {
        def findMinUtil(l: Int, r: Int): Int = {
            if (l == r) {
                nums(l)
            } else {
                val mid = (l + r) / 2
                if (mid == l && nums(mid) < nums(r)) {
                    nums(l)
                } else if (mid - 1 >= 0 && nums(mid - 1) > nums(mid)) {
                    nums(mid)
                } else if (nums(mid) < nums(l)) {
                    findMinUtil(l, mid - 1)
                } else if (nums(mid) > nums(r)) {
                    findMinUtil(mid + 1, r)
                } else {
                    findMinUtil(l, mid - 1)
                }
            }
        }

        val l = 0
        val r = nums.length - 1
        findMinUtil(l, r)
    }
}
