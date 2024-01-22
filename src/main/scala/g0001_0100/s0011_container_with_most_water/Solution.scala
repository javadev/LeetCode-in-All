package g0001_0100.s0011_container_with_most_water

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Greedy #Two_Pointers
// #Algorithm_II_Day_4_Two_Pointers #Big_O_Time_O(n)_Space_O(1)
// #2023_10_29_Time_683_ms_(99.13%)_Space_76.3_MB_(73.04%)

object Solution {
    def maxArea(height: Array[Int]): Int = {
        var maxArea = -1
        var left = 0
        var right = height.length - 1

        while (left < right) {
            if (height(left) < height(right)) {
                maxArea = maxArea.max(height(left) * (right - left))
                left += 1
            } else {
                maxArea = maxArea.max(height(right) * (right - left))
                right -= 1
            }
        }

        maxArea
    }
}
