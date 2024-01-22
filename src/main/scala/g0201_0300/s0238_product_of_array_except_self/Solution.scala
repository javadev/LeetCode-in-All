package g0201_0300.s0238_product_of_array_except_self

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Prefix_Sum
// #Data_Structure_II_Day_5_Array #Udemy_Arrays #Big_O_Time_O(n^2)_Space_O(n)
// #2023_11_07_Time_634_ms_(79.44%)_Space_65.6_MB_(75.70%)

object Solution {
    def productExceptSelf(nums: Array[Int]): Array[Int] = {
        var product = 1
        val ans = new Array[Int](nums.length)

        for (num <- nums) {
            product = product * num
        }

        for (i <- nums.indices) {
            if (nums(i) != 0) {
                ans(i) = product / nums(i)
            } else {
                var p = 1
                for (j <- nums.indices) {
                    if (j != i) {
                        p = p * nums(j)
                    }
                }
                ans(i) = p
            }
        }

        ans
    }
}
