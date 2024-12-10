// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search
// #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_5 #Big_O_Time_O(log_n)_Space_O(1)
// #2024_12_05_Time_0_ms_(100.00%)_Space_49.9_MB_(40.62%)

/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var searchRange = function(nums, target) {
    return [
        helper(nums, target, false),
        helper(nums, target, true)
    ]
}

function helper(nums, target, equals) {
    let l = 0, r = nums.length - 1
    let result = -1

    while (l <= r) {
        const mid = Math.floor((l + r) / 2)
        if (nums[mid] === target) {
            result = mid
        }
        if (nums[mid] < target || (nums[mid] === target && equals)) {
            l = mid + 1
        } else {
            r = mid - 1
        }
    }

    return result
};

export { searchRange }
