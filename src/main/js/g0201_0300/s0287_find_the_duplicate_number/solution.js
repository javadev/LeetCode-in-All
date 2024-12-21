// #Medium #Top_100_Liked_Questions #Array #Binary_Search #Two_Pointers #Bit_Manipulation
// #Binary_Search_II_Day_5 #Big_O_Time_O(n)_Space_O(n)
// #2024_12_21_Time_1_ms_(99.54%)_Space_60.7_MB_(45.93%)

/**
 * @param {number[]} nums
 * @return {number}
 */
var findDuplicate = function(nums) {
    const arr = new Array(nums.length + 1).fill(0)

    for (const num of nums) {
        arr[num] += 1
        if (arr[num] === 2) {
            return num
        }
    }

    return 0
};

export { findDuplicate }
