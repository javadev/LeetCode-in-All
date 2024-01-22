package g0101_0200.s0152_maximum_product_subarray

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Dynamic_Programming_I_Day_6 #Level_2_Day_13_Dynamic_Programming #Udemy_Dynamic_Programming
// #Big_O_Time_O(N)_Space_O(1) #2023_11_04_Time_472_ms_(100.00%)_Space_56.8_MB_(18.18%)

object Solution {
    def maxProduct(arr: Array[Int]): Int = {
        var ans = Int.MinValue
        var cprod = 1

        for (j <- arr) {
            cprod = cprod * j
            ans = math.max(ans, cprod)
            if (cprod == 0) {
                cprod = 1
            }
        }

        cprod = 1

        for (i <- arr.length - 1 to 0 by -1) {
            cprod = cprod * arr(i)
            ans = math.max(ans, cprod)
            if (cprod == 0) {
                cprod = 1
            }
        }

        ans
    }
}
