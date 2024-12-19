// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Heap_Priority_Queue
// #Divide_and_Conquer #Quickselect #Data_Structure_II_Day_20_Heap_Priority_Queue
// #Big_O_Time_O(n*log(n))_Space_O(log(n)) #2024_12_18_Time_9_ms_(97.67%)_Space_59.2_MB_(71.97%)

/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var findKthLargest = function(nums, k) {
    const min = Math.min(...nums)
    const max = Math.max(...nums)
    const dp = new Array(max - min + 1).fill(0)
    for (let num of nums) {
        dp[num - min]++
    }
    for (let i = dp.length-1; i >= 0; i--) {
        k -= dp[i]
        if (k <= 0) return i + min
    }
};

export { findKthLargest }
