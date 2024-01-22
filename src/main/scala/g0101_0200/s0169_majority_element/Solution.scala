package g0101_0200.s0169_majority_element

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Sorting #Counting
// #Divide_and_Conquer #Data_Structure_II_Day_1_Array #Udemy_Famous_Algorithm
// #Big_O_Time_O(n)_Space_O(1) #2023_11_05_Time_538_ms_(92.57%)_Space_59.7_MB_(52.70%)

object Solution {
    def majorityElement(nums: Array[Int]): Int = {
        var count = 1
        var majority = nums(0)

        // For Potential Majority Element
        for (i <- 1 until nums.length) {
            if (nums(i) == majority) {
                count += 1
            } else {
                if (count > 1) {
                    count -= 1
                } else {
                    majority = nums(i)
                }
            }
        }

        // For Confirmation
        count = 0
        for (j <- nums) {
            if (j == majority) {
                count += 1
            }
        }

        if (count >= (nums.length / 2) + 1) {
            majority
        } else {
            -1
        }
    }
}
