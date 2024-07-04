// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Level_2_Day_13_Dynamic_Programming
// #Big_O_Time_O(n*sums)_Space_O(n*sums) #2024_07_02_Time_14_ms_(94.25%)_Space_15.1_MB_(96.55%)

class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        var sums = nums.reduce(0, +)
        if sums % 2 == 1 {
            return false
        }
        sums /= 2
        var dp = [Bool](repeating: false, count: sums + 1)
        dp[0] = true
        for num in nums {
            for sum in stride(from: sums, through: num, by: -1) {
                dp[sum] = dp[sum] || dp[sum - num]
            }
        }
        return dp[sums]
    }
}
