// #Easy #Top_100_Liked_Questions #Array #Two_Pointers #Algorithm_I_Day_3_Two_Pointers
// #Programming_Skills_I_Day_6_Array #Udemy_Arrays #Big_O_Time_O(n)_Space_O(1)
// #2024_12_21_Time_0_ms_(100.00%)_Space_54.1_MB_(63.69%)

/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var moveZeroes = function(nums) {
    let firstZero = 0

    for (let i = 0; i < nums.length; i++) {
        if (nums[i] !== 0) {
            swap(firstZero, i, nums)
            firstZero++
        }
    }
};

const swap = (index1, index2, nums) => {
    const temp = nums[index2]
    nums[index2] = nums[index1]
    nums[index1] = temp
};

export { moveZeroes }
