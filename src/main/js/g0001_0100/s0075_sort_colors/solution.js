// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Sorting #Two_Pointers
// #Data_Structure_II_Day_2_Array #Udemy_Arrays #Big_O_Time_O(n)_Space_O(1)
// #2024_12_11_Time_0_ms_(100.00%)_Space_48.8_MB_(84.42%)

/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var sortColors = function(nums) {
    let zeroes = 0
    let ones = 0

    // Count 0s and place them at the start
    for (let num of nums) {
        if (num === 0) {
            nums[zeroes++] = 0
        } else if (num === 1) {
            ones++
        }
    }

    // Place 1s after the 0s
    for (let j = zeroes; j < zeroes + ones; j++) {
        nums[j] = 1
    }

    // Place 2s after the 1s
    for (let k = zeroes + ones; k < nums.length; k++) {
        nums[k] = 2
    }
};

export { sortColors }
