package g0101_0200.s0136_single_number

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Bit_Manipulation
// #Data_Structure_II_Day_1_Array #Algorithm_I_Day_14_Bit_Manipulation #Udemy_Integers
// #Big_O_Time_O(N)_Space_O(1) #2023_11_04_Time_530_ms_(78.57%)_Space_56.1_MB_(44.05%)

object Solution {
    def singleNumber(nums: Array[Int]): Int = {
        nums.foldLeft(0)(_ ^ _)
    }
}
