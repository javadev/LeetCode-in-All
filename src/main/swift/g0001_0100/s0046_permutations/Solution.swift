// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Backtracking
// #Algorithm_I_Day_11_Recursion_Backtracking #Level_2_Day_20_Brute_Force/Backtracking
// #Udemy_Backtracking/Recursion #Big_O_Time_O(n*n!)_Space_O(n+n!)
// #2024_06_23_Time_8_ms_(86.06%)_Space_15.9_MB_(93.82%)

public class Solution {
    public func permute(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return []
        }
        var finalResult = [[Int]]()
        var currResult = [Int]()
        var used = [Bool](repeating: false, count: nums.count)
        permuteRecur(nums, &finalResult, &currResult, &used)
        return finalResult
    }

    private func permuteRecur(_ nums: [Int], _ finalResult: inout [[Int]], _ currResult: inout [Int], _ used: inout [Bool]) {
        if currResult.count == nums.count {
            finalResult.append(currResult)
            return
        }
        for i in 0..<nums.count {
            if used[i] {
                continue
            }
            currResult.append(nums[i])
            used[i] = true
            permuteRecur(nums, &finalResult, &currResult, &used)
            used[i] = false
            currResult.removeLast()
        }
    }
}
