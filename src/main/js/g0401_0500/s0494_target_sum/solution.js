// #Medium #Array #Dynamic_Programming #Backtracking #Big_O_Time_O(n*(sum+s))_Space_O(n*(sum+s))
// #2024_12_24_Time_2_ms_(99.66%)_Space_51.5_MB_(61.90%)

/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var findTargetSumWays = function(nums, target) {
    const n = nums.length
    let totalSum = 0
    for (let i = 0; i < n; i++) {
        totalSum += nums[i]
    }

    const sum = totalSum - target
    if (sum < 0 || sum % 2 === 1) {
        return 0
    }

    const targetSum = Math.floor(sum / 2)

    // Helper function to solve the problem
    const solve = (nums, target) => {
        let prev = new Array(target + 1).fill(0)

        if (nums[0] === 0) {
            prev[0] = 2 // Two ways to form sum 0: +0 and -0
        } else {
            prev[0] = 1
        }

        if (nums[0] !== 0 && nums[0] <= target) {
            prev[nums[0]] = 1
        }

        for (let i = 1; i < nums.length; i++) {
            const curr = new Array(target + 1).fill(0)
            for (let j = 0; j <= target; j++) {
                const taken = j >= nums[i] ? prev[j - nums[i]] : 0
                const nonTaken = prev[j]
                curr[j] = taken + nonTaken
            }
            prev = curr
        }

        return prev[target]
    }

    return solve(nums, targetSum)
};

export { findTargetSumWays }
