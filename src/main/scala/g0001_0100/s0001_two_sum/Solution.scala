package g0001_0100.s0001_two_sum

// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table
// #Data_Structure_I_Day_2_Array #Level_1_Day_13_Hashmap #Udemy_Arrays #Big_O_Time_O(n)_Space_O(n)
// #2023_10_08_Time_517_ms_(86.66%)_Space_56.2_MB_(68.04%)

object Solution {
    def twoSum(nums: Array[Int], target: Int): Array[Int] = {
        val lookup = scala.collection.mutable.Map[Int, Int]()
        for (idx <- nums.indices) {
            if (lookup.contains(target - nums(idx))) {
                return Array(lookup(target - nums(idx)), idx)
            } else {
                lookup.addOne(nums(idx) -> idx)
            }
        }
        Array(-1, -1)
    }
}
