package g0501_0600.s0560_subarray_sum_equals_k

// #Medium #Top_100_Liked_Questions #Array #Hash_Table #Prefix_Sum #Data_Structure_II_Day_5_Array
// #Big_O_Time_O(n)_Space_O(n) #2023_11_09_Time_627_ms_(92.31%)_Space_59.9_MB_(61.54%)

import scala.collection.mutable.Map

object Solution {
    def subarraySum(nums: Array[Int], k: Int): Int = {
        var tempSum = 0
        var ret = 0
        val sumCount: Map[Int, Int] = Map(0 -> 1)

        for (i <- nums) {
            tempSum += i

            if (sumCount.contains(tempSum - k)) {
                ret += sumCount(tempSum - k)
            }

            sumCount.updateWith(tempSum) {
                case Some(count) => Some(count + 1)
                case None => Some(1)
            }
        }

        ret
    }
}
