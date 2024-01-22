package g0001_0100.s0015_3sum

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Two_Pointers
// #Data_Structure_II_Day_1_Array #Algorithm_II_Day_3_Two_Pointers #Udemy_Two_Pointers
// #Big_O_Time_O(n*log(n))_Space_O(n^2) #2023_10_29_Time_721_ms_(95.24%)_Space_66.4_MB_(91.67%)

object Solution {
    @SuppressWarnings(Array("scala:S3776"))
    def threeSum(nums: Array[Int]): List[List[Int]] = {
        val sortedNums = nums.sorted
        var result: List[List[Int]] = List()
        for (i <- 0 until sortedNums.length - 2) {
            if (i == 0 || (i > 0 && sortedNums(i) != sortedNums(i - 1))) {
                var left = i + 1
                var right = sortedNums.length - 1
                val target = -sortedNums(i)
                while (left < right) {
                    if (sortedNums(left) + sortedNums(right) == target) {
                        result = List(sortedNums(i), sortedNums(left), sortedNums(right)) :: result
                        while (left < right && sortedNums(left) == sortedNums(left + 1))
                            left += 1
                        while (left < right && sortedNums(right) == sortedNums(right - 1))
                            right -= 1

                        left += 1
                        right -= 1
                    } else if (sortedNums(left) + sortedNums(right) < target)
                        left += 1
                    else
                        right -= 1
                }
            }
        }
        result
    }
}
