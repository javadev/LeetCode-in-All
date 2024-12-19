// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Math #Two_Pointers
// #Algorithm_I_Day_2_Two_Pointers #Udemy_Arrays #Big_O_Time_O(n)_Space_O(1)
// #2024_12_17_Time_0_ms_(100.00%)_Space_60.8_MB_(38.22%)

/**
 * @param {number[]} nums
 * @param {number} k
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var reverse = function(nums, l, r) {
    while (l <= r) {
        let temp = nums[l]
        nums[l] = nums[r]
        nums[r] = temp
        l++
        r--
    }
};

const rotate = function(nums, k) {
    const n = nums.length
    const t = n - (k % n)
    reverse(nums, 0, t - 1)
    reverse(nums, t, n - 1)
    reverse(nums, 0, n - 1)
};

export { rotate }
