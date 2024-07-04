// #Medium #Top_100_Liked_Questions #String #Dynamic_Programming
// #Algorithm_II_Day_18_Dynamic_Programming #Dynamic_Programming_I_Day_19
// #Udemy_Dynamic_Programming #Big_O_Time_O(n^2)_Space_O(n2)
// #2024_06_24_Time_9_ms_(77.98%)_Space_18.1_MB_(46.79%)

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        var n = word1.count
        var m = word2.count
        if word1 == word2 { return 0}
        if m == 0 && n == 0 { return 0 }
        if m == 1 || n == 1 { return 1}
        var word1 = Array(word1)
        var word2 = Array(word2)
        var dp: [[Int]] = Array(repeating:Array(repeating: 0, count:m+1), count:n+1)
        for i in 0...n {
            dp[i][0] = i
        }
        for j in 0...m {
            dp[0][j] = j
        }
        for i in 1...n {
            for j in 1...m {
                if word1[i-1] == word2[j-1] {
                     dp[i][j] = dp[i-1][j-1]
                } else {
                     dp[i][j] = min(min(dp[i-1][j-1], dp[i-1][j]), dp[i][j-1]) + 1
                }
            }
        }
        return dp[n][m]
    }
}
