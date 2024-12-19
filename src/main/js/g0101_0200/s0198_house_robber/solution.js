// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming
// #Algorithm_I_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_3
// #Level_2_Day_12_Dynamic_Programming #Udemy_Dynamic_Programming #Big_O_Time_O(n)_Space_O(n)
// #2024_12_17_Time_0_ms_(100.00%)_Space_49_MB_(33.76%)

/**
 * @param {number[]} nums
 * @return {number}
 */
var rob = function(nums) {
    if (nums.length === 0) {
        return 0
    }
    if (nums.length === 1) {
        return nums[0]
    }
    if (nums.length === 2) {
        return Math.max(nums[0], nums[1])
    }

    const profit = new Array(nums.length)
    profit[0] = nums[0]
    profit[1] = Math.max(nums[0], nums[1])

    for (let i = 2; i < nums.length; i++) {
        profit[i] = Math.max(profit[i - 1], nums[i] + profit[i - 2])
    }

    return profit[nums.length - 1]
};

export { rob }
