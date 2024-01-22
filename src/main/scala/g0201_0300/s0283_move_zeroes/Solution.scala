package g0201_0300.s0283_move_zeroes

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Two_Pointers
// #Algorithm_I_Day_3_Two_Pointers #Programming_Skills_I_Day_6_Array #Udemy_Arrays
// #Big_O_Time_O(n)_Space_O(1) #2023_11_07_Time_572_ms_(86.11%)_Space_56.1_MB_(47.22%)

object Solution {
    def moveZeroes(nums: Array[Int]): Unit = {
        var firstZero = 0
        for (i <- nums.indices) {
            if (nums(i) != 0) {
                swap(firstZero, i, nums)
                firstZero += 1
            }
        }
    }

    private def swap(index1: Int, index2: Int, numbers: Array[Int]): Unit = {
        val val2 = numbers(index2)
        numbers(index2) = numbers(index1)
        numbers(index1) = val2
    }
}
