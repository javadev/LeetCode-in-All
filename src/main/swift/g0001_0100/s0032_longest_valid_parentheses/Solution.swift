// #Hard #Top_100_Liked_Questions #String #Dynamic_Programming #Stack #Big_O_Time_O(n)_Space_O(1)
// #2024_06_19_Time_3_ms_(95.06%)_Space_16.4_MB_(60.49%)

class Solution {
    public func longestValidParentheses(_ s: String) -> Int {
        var maxLen = 0
        var left = 0
        var right = 0
        let n = s.count
        let characters = Array(s)

        for i in 0..<n {
            if characters[i] == "(" {
                left += 1
            } else {
                right += 1
            }
            if right > left {
                left = 0
                right = 0
            }
            if left == right {
                maxLen = max(maxLen, left + right)
            }
        }

        left = 0
        right = 0
        for i in (0..<n).reversed() {
            if characters[i] == "(" {
                left += 1
            } else {
                right += 1
            }
            if left > right {
                left = 0
                right = 0
            }
            if left == right {
                maxLen = max(maxLen, left + right)
            }
        }

        return maxLen
    }
}
