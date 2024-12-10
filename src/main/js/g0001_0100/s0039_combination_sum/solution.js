// #Medium #Top_100_Liked_Questions #Array #Backtracking #Algorithm_II_Day_10_Recursion_Backtracking
// #Level_2_Day_20_Brute_Force/Backtracking #Udemy_Backtracking/Recursion
// #Big_O_Time_O(2^n)_Space_O(n+2^n) #2024_12_08_Time_1_ms_(98.51%)_Space_54.6_MB_(59.25%)

/**
 * @param {number[]} candidates
 * @param {number} target
 * @return {number[][]}
 */
var combinationSum = function(candidates, target) {
    const ans = []
    const subList = []

    const combinationSumRec = (n, candidates, target, subList, ans) => {
        if (target === 0 || n === 0) {
            if (target === 0) {
                ans.push([...subList]) // Create a copy of subList
            }
            return
        }

        if (target - candidates[n - 1] >= 0) {
            subList.push(candidates[n - 1])
            combinationSumRec(n, candidates, target - candidates[n - 1], subList, ans)
            subList.pop() // Backtracking step
        }

        combinationSumRec(n - 1, candidates, target, subList, ans)
    }

    combinationSumRec(candidates.length, candidates, target, subList, ans)
    return ans
};

export { combinationSum }
