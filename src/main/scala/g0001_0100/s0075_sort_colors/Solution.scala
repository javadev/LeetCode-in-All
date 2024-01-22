package g0001_0100.s0075_sort_colors

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Two_Pointers
// #Data_Structure_II_Day_2_Array #Udemy_Arrays #Big_O_Time_O(n)_Space_O(1)
// #2023_11_02_Time_450_ms_(84.21%)_Space_54.6_MB_(73.68%)

object Solution {
    def sortColors(nums: Array[Int]): Unit = {
        var zeroes = 0
        var ones = 0

        for (i <- nums.indices) {
            if (nums(i) == 0) {
                nums(zeroes) = 0
                zeroes += 1
            } else if (nums(i) == 1) {
                ones += 1
            }
        }

        for (j <- zeroes until zeroes + ones) {
            nums(j) = 1
        }

        for (k <- zeroes + ones until nums.length) {
            nums(k) = 2
        }
    }
}
