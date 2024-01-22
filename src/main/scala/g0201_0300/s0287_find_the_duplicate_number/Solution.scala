package g0201_0300.s0287_find_the_duplicate_number

// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search #Two_Pointers
// #Bit_Manipulation #Binary_Search_II_Day_5 #Big_O_Time_O(n)_Space_O(n)
// #2023_11_08_Time_765_ms_(77.38%)_Space_75.7_MB_(96.43%)

object Solution {
    def findDuplicate(nums: Array[Int]): Int = {
        val arr = new Array[Int](nums.length + 1)
        for (num <- nums) {
            arr(num) += 1
            if (arr(num) == 2) {
                return num
            }
        }
        0
    }
}
