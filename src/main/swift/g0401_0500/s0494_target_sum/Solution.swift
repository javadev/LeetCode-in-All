// #Medium #Array #Dynamic_Programming #Backtracking #Big_O_Time_O(n*(sum+s))_Space_O(n*(sum+s))
// #2024_07_03_Time_0_ms_(100.00%)_Space_15.2_MB_(92.73%)

class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        let sum = nums.reduce(0,+)
        let positiveSubsetVal = (target + sum)/2
        if target > sum || target < -sum {
            return 0
        } else if positiveSubsetVal - (sum - positiveSubsetVal) != target {
            return 0
        }
        var prev = Array(repeating: 0, count: positiveSubsetVal+1)
        var curr = Array(repeating: 0, count: positiveSubsetVal+1)
        prev[0] = 1
        for row in 0..<nums.count {
            for col in 0..<positiveSubsetVal+1 {
                let includingCount = col - nums[row] >= 0 ? prev[col - nums[row]] : 0
                curr[col] = prev[col] + includingCount
            }
            prev = curr
        }
        
        return curr[curr.count-1]
    }
}
