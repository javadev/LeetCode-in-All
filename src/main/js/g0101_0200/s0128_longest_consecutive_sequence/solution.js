// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Union_Find
// #Big_O_Time_O(N_log_N)_Space_O(1) #2024_12_15_Time_31_ms_(93.87%)_Space_59_MB_(96.32%)

/**
 * @param {number[]} nums
 * @return {number}
 */
var longestConsecutive = function(nums) {
    if (nums.length === 0) {
        return 0
    }
    nums.sort((a, b) => a - b)
    let max = Number.MIN_SAFE_INTEGER
    let thsMax = 1
    for (let i = 0; i < nums.length - 1; i++) {
        if (nums[i + 1] === nums[i] + 1) {
            thsMax += 1
            continue
        }
        if (nums[i + 1] === nums[i]) {
            continue
        }
        max = Math.max(max, thsMax)
        thsMax = 1 // NOSONAR
    }
    return Math.max(max, thsMax)
};

export { longestConsecutive }
