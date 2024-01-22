package g0001_0100.s0031_next_permutation

// #Medium #Top_100_Liked_Questions #Array #Two_Pointers #Big_O_Time_O(n)_Space_O(1)
// #2023_10_30_Time_462_ms_(100.00%)_Space_55.3_MB_(54.55%)

object Solution {
    def nextPermutation(nums: Array[Int]): Unit = {
        if (nums == null || nums.length <= 1) {
            return
        }
        var i = nums.length - 2
        while (i >= 0 && nums(i) >= nums(i + 1)) {
            i -= 1
        }
        if (i >= 0) {
            var j = nums.length - 1
            while (nums(j) <= nums(i)) {
                j -= 1
            }
            swap(nums, i, j)
        }
        reverse(nums, i + 1, nums.length - 1)
    }

    private def swap(nums: Array[Int], i: Int, j: Int): Unit = {
        val temp = nums(i)
        nums(i) = nums(j)
        nums(j) = temp
    }

    private def reverse(nums: Array[Int], i: Int, j: Int): Unit = {
        var start = i
        var end = j
        while (start < end) {
            swap(nums, start, end)
            start += 1
            end -= 1
        }
    }
}
