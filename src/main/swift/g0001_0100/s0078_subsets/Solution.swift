// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Bit_Manipulation #Backtracking
// #Algorithm_II_Day_9_Recursion_Backtracking #Udemy_Backtracking/Recursion
// #Big_O_Time_O(2^n)_Space_O(n*2^n) #2024_06_24_Time_0_ms_(100.00%)_Space_16.2_MB_(63.05%)

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        solve(nums, &res, [Int](), 0)
        return res
    }

    private func solve(_ nums: [Int], _ res: inout [[Int]], _ temp: [Int], _ start: Int) {
        res.append(temp)
        for i in start..<nums.count {
            var newTemp = temp
            newTemp.append(nums[i])
            solve(nums, &res, newTemp, i + 1)
        }
    }
}
