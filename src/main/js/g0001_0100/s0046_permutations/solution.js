// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Backtracking
// #Algorithm_I_Day_11_Recursion_Backtracking #Level_2_Day_20_Brute_Force/Backtracking
// #Udemy_Backtracking/Recursion #Big_O_Time_O(n*n!)_Space_O(n+n!)
// #2024_12_08_Time_0_ms_(100.00%)_Space_54.2_MB_(26.23%)

/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var permute = function(nums) {
    if (!nums || nums.length === 0) {
        return []
    }

    const finalResult = []
    const used = new Array(nums.length).fill(false)

    const permuteRecur = (nums, finalResult, currResult, used) => {
        if (currResult.length === nums.length) {
            finalResult.push([...currResult]) // Create a copy of currResult
            return
        }
        for (let i = 0; i < nums.length; i++) {
            if (used[i]) {
                continue
            }
            currResult.push(nums[i])
            used[i] = true
            permuteRecur(nums, finalResult, currResult, used)
            used[i] = false
            currResult.pop() // Backtrack
        }
    }

    permuteRecur(nums, finalResult, [], used)
    return finalResult
};

export { permute }
