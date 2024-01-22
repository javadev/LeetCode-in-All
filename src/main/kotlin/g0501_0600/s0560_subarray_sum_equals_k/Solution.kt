package g0501_0600.s0560_subarray_sum_equals_k

// #Medium #Top_100_Liked_Questions #Array #Hash_Table #Prefix_Sum #Data_Structure_II_Day_5_Array
// #Big_O_Time_O(n)_Space_O(n)

class Solution {
    fun subarraySum(nums: IntArray, k: Int): Int {
        var tempSum = 0
        var ret = 0
        val sumCount: MutableMap<Int, Int?> = HashMap()
        sumCount[0] = 1
        for (i in nums) {
            tempSum += i
            if (sumCount.containsKey(tempSum - k)) {
                ret += sumCount[tempSum - k]!!
            }
            if (sumCount[tempSum] != null) {
                sumCount[tempSum] = sumCount[tempSum]!! + 1
            } else {
                sumCount[tempSum] = 1
            }
        }
        return ret
    }
}
