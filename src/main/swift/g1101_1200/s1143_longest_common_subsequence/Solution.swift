// #Medium #Top_100_Liked_Questions #String #Dynamic_Programming #LeetCode_75_DP/Multidimensional
// #Algorithm_II_Day_17_Dynamic_Programming #Dynamic_Programming_I_Day_19
// #Udemy_Dynamic_Programming #Big_O_Time_O(n*m)_Space_O(n*m)
// #2024_07_03_Time_12_ms_(98.60%)_Space_16.1_MB_(98.60%)

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let text1 = Array(text1), text2 = Array(text2)
        let n = text1.count 
        let m = text2.count
        var dp = [Int](repeating: 0, count: m + 1)
        for i in 0..<n {
            var curRow = [Int](repeating: 0, count: m + 1)
            for j in 0..<m {
                if text1[i] == text2[j] {
                    curRow[j + 1] = 1 + dp[j]
                } else {
                    curRow[j + 1] = max(dp[j + 1], curRow[j])
                }
            }
            dp = curRow
        }
        return dp[m]
    }
}
