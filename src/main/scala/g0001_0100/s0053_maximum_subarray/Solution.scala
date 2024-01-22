package g0001_0100.s0053_maximum_subarray

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Divide_and_Conquer #Data_Structure_I_Day_1_Array #Dynamic_Programming_I_Day_5
// #Udemy_Famous_Algorithm #Big_O_Time_O(n)_Space_O(1)
// #2023_10_31_Time_766_ms_(84.95%)_Space_73.1_MB_(74.19%)

object Solution {
    def maxSubArray(nums: Array[Int]): Int = {
        var maxi = Int.MinValue
        var sum = 0

        for (num <- nums) {
            // calculating sub-array sum
            sum += num
            maxi = math.max(sum, maxi)

            if (sum < 0) {
                // there is no point in carrying a negative subarray sum; set it to 0
                sum = 0
            }
        }

        maxi
    }
}
