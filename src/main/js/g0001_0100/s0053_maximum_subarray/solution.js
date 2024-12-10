// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Divide_and_Conquer #Data_Structure_I_Day_1_Array #Dynamic_Programming_I_Day_5
// #Udemy_Famous_Algorithm #Big_O_Time_O(n)_Space_O(1)
// #2024_12_09_Time_1_ms_(85.69%)_Space_59.1_MB_(13.72%)

/**
 * @param {number[]} nums
 * @return {number}
 */
var maxSubArray = function(nums) {
    let maxi = Number.MIN_SAFE_INTEGER
    let sum = 0

    for (const num of nums) {
        // Calculate subarray sum
        sum += num
        maxi = Math.max(sum, maxi)
        if (sum < 0) {
            // Reset sum if it's negative
            sum = 0
        }
    }

    return maxi
};

export { maxSubArray }
