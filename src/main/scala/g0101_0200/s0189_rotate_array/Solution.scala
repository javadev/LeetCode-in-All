package g0101_0200.s0189_rotate_array

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Math #Two_Pointers
// #Algorithm_I_Day_2_Two_Pointers #Udemy_Arrays #Big_O_Time_O(n)_Space_O(1)
// #2023_11_05_Time_600_ms_(96.59%)_Space_73.7_MB_(17.05%)

object Solution {
    private def reverse(nums: Array[Int], l: Int, r: Int): Unit = {
        var left = l
        var right = r
        while (left <= right) {
            val temp = nums(left)
            nums(left) = nums(right)
            nums(right) = temp
            left += 1
            right -= 1
        }
    }

    def rotate(nums: Array[Int], k: Int): Unit = {
        val n = nums.length
        val t = n - (k % n)
        reverse(nums, 0, t - 1)
        reverse(nums, t, n - 1)
        reverse(nums, 0, n - 1)
    }
}
