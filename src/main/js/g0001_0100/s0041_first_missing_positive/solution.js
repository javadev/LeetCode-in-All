// #Hard #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Udemy_Arrays
// #Big_O_Time_O(n)_Space_O(n) #2024_12_08_Time_1_ms_(98.86%)_Space_56.6_MB_(89.65%)

/**
 * @param {number[]} nums
 * @return {number}
 */
var firstMissingPositive = function(nums) {
    for (let i = 0; i < nums.length; i++) {
        while (
            nums[i] > 0 &&
            nums[i] <= nums.length &&
            nums[nums[i] - 1] !== nums[i]
        ) {
            // Swap nums[i] with nums[nums[i] - 1]
            let temp = nums[nums[i] - 1]
            nums[nums[i] - 1] = nums[i]
            nums[i] = temp
        }
    }

    for (let i = 0; i < nums.length; i++) {
        if (nums[i] !== i + 1) {
            return i + 1
        }
    }

    return nums.length + 1
};

export { firstMissingPositive }
