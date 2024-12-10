// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Dynamic_Programming #Greedy
// #Algorithm_II_Day_12_Dynamic_Programming #Dynamic_Programming_I_Day_4 #Udemy_Arrays
// #Big_O_Time_O(n)_Space_O(1) #2024_12_09_Time_0_ms_(100.00%)_Space_53.2_MB_(74.50%)

/**
 * @param {number[]} nums
 * @return {boolean}
 */
var canJump = function(nums) {
    if (nums.length === 1) {
        return true
    }
    if (nums[0] === 0) {
        return false
    }
    let fin = nums.length - 1
    for (let i = nums.length - 2; i >= 0; i--) {
        if (nums[i] + i >= fin) {
            fin = i
        }
    }
    return fin === 0
};

export { canJump }
