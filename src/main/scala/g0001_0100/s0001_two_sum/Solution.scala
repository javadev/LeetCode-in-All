package g0001_0100.s0001_two_sum

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table
// #Data_Structure_I_Day_2_Array #Level_1_Day_13_Hashmap #Udemy_Arrays #Big_O_Time_O(n)_Space_O(n)
// #2024_05_15_Time_680_ms_(76.33%)_Space_59.5_MB_(64.20%)

object Solution {
    def twoSum(nums: Array[Int], target: Int): Array[Int] = {
        val indiced = nums.zipWithIndex
        val sortedStruct = indiced.sortBy(_._1)
        var i = 0
        var j = nums.length - 1
        while (i < j && j > 0) {
            if sortedStruct(j)._1 + sortedStruct(i)._1 > target then j = j - 1
            else if sortedStruct(j)._1 + sortedStruct(i)._1 < target then i = i + 1
            else return Array(sortedStruct(i)._2, sortedStruct(j)._2)
        }
        return Array(-1, -1)
    }
}
