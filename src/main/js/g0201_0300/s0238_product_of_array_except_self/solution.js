// #Medium #Top_100_Liked_Questions #Array #Prefix_Sum #Data_Structure_II_Day_5_Array #Udemy_Arrays
// #Big_O_Time_O(n^2)_Space_O(n) #2024_12_21_Time_3_ms_(93.60%)_Space_64.9_MB_(45.67%)

/**
 * @param {number[]} nums
 * @return {number[]}
 */
var productExceptSelf = function(nums) {
    const res = new Array(nums.length).fill(1)

    // Compute prefix product
    let prefixProduct = 1
    for (let i = 0; i < nums.length; i++) {
        res[i] = prefixProduct
        prefixProduct *= nums[i]
    }

    // Compute suffix product and multiply with prefix product
    let suffixProduct = 1
    for (let i = nums.length - 1; i >= 0; i--) {
        res[i] *= suffixProduct
        suffixProduct *= nums[i]
    }

    return res
};

export { productExceptSelf }
