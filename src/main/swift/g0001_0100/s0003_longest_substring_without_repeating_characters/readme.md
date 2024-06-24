3\. Longest Substring Without Repeating Characters

Medium

Given a string `s`, find the length of the **longest substring** without repeating characters.

**Example 1:**

**Input:** s = "abcabcbb"

**Output:** 3

**Explanation:** The answer is "abc", with the length of 3. 

**Example 2:**

**Input:** s = "bbbbb"

**Output:** 1

**Explanation:** The answer is "b", with the length of 1. 

**Example 3:**

**Input:** s = "pwwkew"

**Output:** 3

**Explanation:** The answer is "wke", with the length of 3. Notice that the answer must be a substring, "pwke" is a subsequence and not a substring. 

**Example 4:**

**Input:** s = ""

**Output:** 0 

**Constraints:**

*   <code>0 <= s.length <= 5 * 10<sup>4</sup></code>
*   `s` consists of English letters, digits, symbols and spaces.

To solve the Longest Substring Without Repeating Characters problem in Swift using a `Solution` class, we'll follow these steps:

1. Define a `Solution` class with a method named `lengthOfLongestSubstring`.
2. Initialize variables to keep track of the starting index of the substring (`start`), the maximum length (`maxLen`), and a hashmap to store characters and their indices.
3. Iterate through the string `s`, and for each character:
   - Check if the character exists in the hashmap and its index is greater than or equal to the `start` index.
   - If found, update the `start` index to the index after the last occurrence of the character.
   - Update the maximum length if necessary.
   - Update the index of the current character in the hashmap.
4. Return the maximum length found.
5. Handle the edge case where the input string is empty.

Here's the implementation:

```swift
public class Solution {
    public func lengthOfLongestSubstring(_ s: String) -> Int {
        var lastIndices = Array(repeating: -1, count: 256)
        var maxLen = 0
        var curLen = 0
        var start = 0

        for (i, char) in s.enumerated() {
            let asciiValue = Int(char.asciiValue!)
            if lastIndices[asciiValue] < start {
                lastIndices[asciiValue] = i
                curLen += 1
            } else {
                let lastIndex = lastIndices[asciiValue]
                start = lastIndex + 1
                curLen = i - start + 1
                lastIndices[asciiValue] = i
            }
            if curLen > maxLen {
                maxLen = curLen
            }
        }
        return maxLen
    }
}
```

This implementation provides a solution to the Longest Substring Without Repeating Characters problem in Swift.