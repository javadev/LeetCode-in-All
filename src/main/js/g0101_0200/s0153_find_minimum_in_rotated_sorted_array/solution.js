// #Medium #Top_100_Liked_Questions #Array #Binary_Search #Algorithm_II_Day_2_Binary_Search
// #Binary_Search_I_Day_12 #Udemy_Binary_Search #Big_O_Time_O(log_N)_Space_O(log_N)
// #2024_12_16_Time_0_ms_(100.00%)_Space_48.6_MB_(91.77%)

/**
 * @param {number[]} nums
 * @return {number}
 */
var findMin = function(nums) {
    function findMinUtil(nums, l, r) {
        if (l === r) {
            return nums[l]
        }
        let mid = Math.floor((l + r) / 2)

        if (mid === l && nums[mid] < nums[r]) {
            return nums[l]
        }
        if (mid - 1 >= 0 && nums[mid - 1] > nums[mid]) {
            return nums[mid]
        }
        if (nums[mid] < nums[l]) {
            return findMinUtil(nums, l, mid - 1)
        } else if (nums[mid] > nums[r]) {
            return findMinUtil(nums, mid + 1, r)
        }
        return findMinUtil(nums, l, mid - 1)
    }

    let l = 0
    let r = nums.length - 1
    return findMinUtil(nums, l, r)
};

export { findMin }
