// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Level_2_Day_13_Dynamic_Programming
// #Big_O_Time_O(n*sums)_Space_O(n*sums) #2024_12_22_Time_18_ms_(97.98%)_Space_51.4_MB_(95.09%)

/**
 * @param {number[]} nums
 * @return {boolean}
 */
var canPartition = function(nums) {
    let sum = nums.reduce((acc, val) => acc + val, 0)
    if (sum % 2 !== 0) {
        return false
    }
    sum /= 2
    
    const set = new Array(sum + 1).fill(false)
    const arr = new Array(sum + 2).fill(0)
    let top = 0

    for (let val of nums) {
        for (let i = top; i >= 0; i--) {
            const tempSum = val + arr[i]
            if (tempSum <= sum && !set[tempSum]) {
                if (tempSum === sum) {
                    return true
                }
                set[tempSum] = true
                arr[++top] = tempSum
            }
        }
    }

    return false
};

export { canPartition }
