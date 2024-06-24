// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #String #Dynamic_Programming
// #Data_Structure_II_Day_9_String #Algorithm_II_Day_14_Dynamic_Programming
// #Dynamic_Programming_I_Day_17 #Udemy_Strings #Big_O_Time_O(n)_Space_O(n)
// #2024_06_17_Time_10_ms_(97.20%)_Space_16.5_MB_(62.80%)

public class Solution {
    public func longestPalindrome(_ s: String) -> String {
        let n = s.count
        guard n > 0 else { return "" }

        // Convert string to newStr with separators
        var newStr = [Character](repeating: "#", count: 2 * n + 1)
        for (i, char) in s.enumerated() {
            newStr[2 * i + 1] = char
        }

        var dp = [Int](repeating: 0, count: newStr.count)
        var friendCenter = 0
        var friendRadius = 0
        var lpsCenter = 0
        var lpsRadius = 0

        for i in 0..<newStr.count {
            dp[i] = (friendCenter + friendRadius > i) 
                ? min(dp[2 * friendCenter - i], friendCenter + friendRadius - i) 
                : 1

            while i + dp[i] < newStr.count && i - dp[i] >= 0 && newStr[i + dp[i]] == newStr[i - dp[i]] {
                dp[i] += 1
            }

            if friendCenter + friendRadius < i + dp[i] {
                friendCenter = i
                friendRadius = dp[i]
            }

            if lpsRadius < dp[i] {
                lpsCenter = i
                lpsRadius = dp[i]
            }
        }

        let start = (lpsCenter - lpsRadius + 1) / 2
        let end = (lpsCenter + lpsRadius - 1) / 2
        return String(s[s.index(s.startIndex, offsetBy: start)..<s.index(s.startIndex, offsetBy: end)])
    }
}

