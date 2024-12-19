// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Dynamic_Programming_I_Day_6 #Level_2_Day_13_Dynamic_Programming #Udemy_Dynamic_Programming
// #Big_O_Time_O(N)_Space_O(1) #2024_12_16_Time_0_ms_(100.00%)_Space_50.9_MB_(51.22%)

/**
 * @param {number[]} nums
 * @return {number}
 */
var maxProduct = function(nums) {
    let overAllMaxProd = Number.MIN_SAFE_INTEGER
    let n = nums.length
    let start = 1
    let end = 1

    for (let i = 0; i < n; i++) {
        // Reset `start` and `end` to 1 if they become 0
        if (start === 0) {
            start = 1
        }
        if (end === 0) {
            end = 1
        }

        start *= nums[i]
        end *= nums[n - i - 1]

        overAllMaxProd = Math.max(overAllMaxProd, Math.max(start, end))
    }

    return overAllMaxProd
};

export { maxProduct }
