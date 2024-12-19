// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Bit_Manipulation
// #Data_Structure_II_Day_1_Array #Algorithm_I_Day_14_Bit_Manipulation #Udemy_Integers
// #Big_O_Time_O(N)_Space_O(1) #2024_12_15_Time_0_ms_(100.00%)_Space_52.3_MB_(38.50%)

/**
 * @param {number[]} nums
 * @return {number}
 */
var singleNumber = function(nums) {
    let res = 0
    for (const num of nums) {
        res ^= num
    }
    return res
};

export { singleNumber }
