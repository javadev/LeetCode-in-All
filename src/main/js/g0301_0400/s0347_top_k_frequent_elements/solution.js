// #Medium #Top_100_Liked_Questions #Array #Hash_Table #Sorting #Heap_Priority_Queue #Counting
// #Divide_and_Conquer #Quickselect #Bucket_Sort #Data_Structure_II_Day_20_Heap_Priority_Queue
// #Big_O_Time_O(n*log(n))_Space_O(k) #2024_12_22_Time_6_ms_(95.00%)_Space_54.3_MB_(53.50%)

/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
var topKFrequent = function (nums, k) {
    let obj = {}, result = []
    for (let item of nums) {
        obj[item] = (obj[item] ? obj[item] : 0) + 1
    }
    let temp = Object.entries(obj).sort((a, b) => b[1] - a[1])
    for (let i = 0; i < k; i++) {
        result.push(Number(temp[i][0]))
    }
    return result
};

export { topKFrequent }
