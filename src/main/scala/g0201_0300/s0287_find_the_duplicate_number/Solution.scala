package g0201_0300.s0287_find_the_duplicate_number

// #Medium #Top_100_Liked_Questions #Array #Binary_Search #Two_Pointers #Bit_Manipulation
// #Binary_Search_II_Day_5 #Big_O_Time_O(n)_Space_O(n)
// #2024_06_02_Time_866_ms_(83.33%)_Space_77.4_MB_(50.00%)

object Solution {
    def findDuplicate(nums: Array[Int]): Int = {
        val arr = new Array[Int](nums.length + 1)
        var duplicate = 0
        for (num <- nums) {
            arr(num) += 1
            if (arr(num) == 2) {
                duplicate = num
            }
        }
        duplicate
    }
}
