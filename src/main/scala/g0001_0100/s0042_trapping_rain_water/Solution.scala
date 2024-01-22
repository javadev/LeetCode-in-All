package g0001_0100.s0042_trapping_rain_water

// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming #Two_Pointers
// #Stack #Monotonic_Stack #Dynamic_Programming_I_Day_9 #Udemy_Two_Pointers
// #Big_O_Time_O(n)_Space_O(1) #2023_10_31_Time_521_ms_(87.88%)_Space_58_MB_(24.24%)

object Solution {
    def trap(height: Array[Int]): Int = {
        var left = 0
        var right = height.length - 1
        var result = 0
        var lowerWall = 0

        while (left < right) {
            val leftValue = height(left)
            val rightValue = height(right)

            if (leftValue < rightValue) {
                lowerWall = Math.max(leftValue, lowerWall)
                result += lowerWall - leftValue
                left += 1
            } else {
                lowerWall = Math.max(rightValue, lowerWall)
                result += lowerWall - rightValue
                right -= 1
            }
        }

        result
    }
}
