// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Greedy
// #Algorithm_II_Day_13_Dynamic_Programming #Dynamic_Programming_I_Day_4
// #Big_O_Time_O(n)_Space_O(1) #2024_12_08_Time_0_ms_(100.00%)_Space_51.5_MB_(23.51%)

/**
 * @param {number[]} nums
 * @return {number}
 */
var getMax = function(nums, l, r) {
    let max = -1
    for (let i = l; i <= r; i++) {
        max = Math.max(max, i + nums[i])
    }
    return max
};

var jump = function(nums) {
    let l = 0
    let r = 0
    let jumps = 0

    while (r < nums.length - 1) {
        let prev = r
        r = getMax(nums, l, r)
        l = prev + 1
        jumps++
    }

    return jumps
};

export { jump }
