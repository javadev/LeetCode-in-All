// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Binary_Search
// #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_11 #Level_2_Day_8_Binary_Search
// #Udemy_Binary_Search #Big_O_Time_O(log_n)_Space_O(1)
// #2024_12_05_Time_0_ms_(100.00%)_Space_49.3_MB_(21.97%)

/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var search = function(nums, target) {
    let lo = 0
    let hi = nums.length - 1
    while (lo <= hi) {
        const mid = Math.floor((hi - lo) / 2) + lo
        if (nums[mid] === target) {
            return mid
        }
        if (nums[lo] <= nums[mid]) {
            // Target is in the sorted left half
            if (nums[lo] <= target && target <= nums[mid]) {
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        } else if (nums[mid] <= target && target <= nums[hi]) {
            lo = mid + 1
        } else {
            hi = mid - 1
        }
    }
    return -1
};

export { search }
