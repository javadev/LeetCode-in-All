// #Easy #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table
// #Data_Structure_I_Day_2_Array #Level_1_Day_13_Hashmap #Udemy_Arrays #Big_O_Time_O(n)_Space_O(n)
// #AI_can_be_used_to_solve_the_task #2024_11_17_Time_1_ms_(89.15%)_Space_51.9_MB_(13.71%)

/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
function twoSum(nums, target) {
    const indexMap = new Map()
    for (let i = 0; i < nums.length; i++) {
        const requiredNum = target - nums[i]
        if (indexMap.has(requiredNum)) {
            return [indexMap.get(requiredNum), i]
        }
        indexMap.set(nums[i], i)
    }
    return [-1, -1]
}

export { twoSum }
