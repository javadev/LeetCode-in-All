// #Easy #Top_100_Liked_Questions #Array #Binary_Search #Algorithm_I_Day_1_Binary_Search
// #Binary_Search_I_Day_2 #Big_O_Time_O(log_n)_Space_O(1)
// #2024_12_05_Time_0_ms_(100.00%)_Space_49.1_MB_(65.54%)

/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var searchInsert = function(nums, target) {
    let lo = 0, hi = nums.length - 1

    while (lo <= hi) {
        const mid = Math.floor(lo + (hi - lo) / 2)

        if (target === nums[mid]) {
            return mid
        } else if (target < nums[mid]) {
            hi = mid - 1
        } else {
            lo = mid + 1
        }
    }

    return lo
};

export { searchInsert }
