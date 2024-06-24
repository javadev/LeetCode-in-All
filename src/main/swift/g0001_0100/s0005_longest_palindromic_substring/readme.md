5\. Longest Palindromic Substring

Medium

Given a string `s`, return _the longest palindromic substring_ in `s`.

**Example 1:**

**Input:** s = "babad"

**Output:** "bab" **Note:** "aba" is also a valid answer. 

**Example 2:**

**Input:** s = "cbbd"

**Output:** "bb" 

**Example 3:**

**Input:** s = "a"

**Output:** "a" 

**Example 4:**

**Input:** s = "ac"

**Output:** "a" 

**Constraints:**

*   `1 <= s.length <= 1000`
*   `s` consist of only digits and English letters.

To solve the Longest Palindromic Substring problem in Swift using a `Solution` class, we'll follow these steps:

1. Define a `Solution` class with a method named `longestPalindrome`.
2. Initialize variables to keep track of the start and end indices of the longest palindromic substring found so far (`start` and `end`).
3. Iterate through the string `s`:
   - For each character in the string, expand around it to check if it forms a palindrome.
   - Handle both odd-length and even-length palindromes separately.
   - Update `start` and `end` indices if a longer palindrome is found.
4. Return the substring from `start` to `end`.
5. Handle edge cases where the input string is empty or has a length of 1.

Here's the implementation:

```swift
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
```

This implementation provides a solution to the Longest Palindromic Substring problem in Swift.