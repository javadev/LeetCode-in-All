// #Medium #Top_100_Liked_Questions #Array #Hash_Table #Prefix_Sum #Data_Structure_II_Day_5_Array
// #Big_O_Time_O(n)_Space_O(n) #2024_12_24_Time_9_ms_(99.38%)_Space_59.7_MB_(42.97%)

/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var subarraySum = function(nums, k) {
    let tempSum = 0
    let ret = 0
    const sumCount = new Map()
    sumCount.set(0, 1)

    for (const num of nums) {
        tempSum += num
        if (sumCount.has(tempSum - k)) {
            ret += sumCount.get(tempSum - k)
        }
        if (sumCount.has(tempSum)) {
            sumCount.set(tempSum, sumCount.get(tempSum) + 1)
        } else {
            sumCount.set(tempSum, 1)
        }
    }

    return ret
};

export { subarraySum }
