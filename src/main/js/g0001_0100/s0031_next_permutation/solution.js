// #Medium #Top_100_Liked_Questions #Array #Two_Pointers #Big_O_Time_O(n)_Space_O(1)
// #2024_12_05_Time_0_ms_(100.00%)_Space_52.3_MB_(8.66%)

/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var nextPermutation = function(nums) {
    if (!nums || nums.length <= 1) {
        return
    }

    let i = nums.length - 2

    // Find the first index `i` where nums[i] < nums[i + 1]
    while (i >= 0 && nums[i] >= nums[i + 1]) {
        i--
    }

    if (i >= 0) {
        // Find the smallest number larger than nums[i] to swap with
        let j = nums.length - 1
        while (nums[j] <= nums[i]) {
            j--
        }
        swap(nums, i, j)
    }

    // Reverse the portion of the array from index `i + 1` to the end
    reverse(nums, i + 1, nums.length - 1)
};

function swap(nums, i, j) {
    const temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
}

function reverse(nums, start, end) {
    while (start < end) {
        swap(nums, start++, end--)
    }
}

export { nextPermutation }
