10\. Regular Expression Matching

Hard

Given an input string `s` and a pattern `p`, implement regular expression matching with support for `'.'` and `'*'` where:

*   `'.'` Matches any single character.
*   `'*'` Matches zero or more of the preceding element.

The matching should cover the **entire** input string (not partial).

**Example 1:**

**Input:** s = "aa", p = "a"

**Output:** false

**Explanation:** "a" does not match the entire string "aa". 

**Example 2:**

**Input:** s = "aa", p = "a\*"

**Output:** true

**Explanation:** '\*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa". 

**Example 3:**

**Input:** s = "ab", p = ".\*"

**Output:** true

**Explanation:** ".\*" means "zero or more (\*) of any character (.)". 

**Example 4:**

**Input:** s = "aab", p = "c\*a\*b"

**Output:** true

**Explanation:** c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab". 

**Example 5:**

**Input:** s = "mississippi", p = "mis\*is\*p\*."

**Output:** false 

**Constraints:**

*   `1 <= s.length <= 20`
*   `1 <= p.length <= 30`
*   `s` contains only lowercase English letters.
*   `p` contains only lowercase English letters, `'.'`, and `'*'`.
*   It is guaranteed for each appearance of the character `'*'`, there will be a previous valid character to match.

To solve the Regular Expression Matching problem in Swift using a `Solution` class, we'll follow these steps:

1. Define a `Solution` class with a method named `isMatch`.
2. Implement a recursive approach to check for pattern matching.
3. Base cases:
   - If the pattern string is empty, return `s.isEmpty()`.
   - If the pattern string's length is 1 or the next character after `*` is `.`:
     - Check if the length of `s` is 1 and the characters match or the pattern is `.`.
     - If so, return `true`; otherwise, return `false`.
4. If the second character of the pattern is not `*`, recursively call `isMatch` with the substring starting from the second character.
5. If the second character of the pattern is `*`, recursively check all possibilities:
   - Zero occurrences of the preceding character (skipping `*` and the character before it).
   - One or more occurrences of the preceding character (matching the first character and recursively calling `isMatch` for the remaining part of the string).
6. Return the result of the recursive checks.
7. Handle edge cases where the input strings are empty or the pattern contains invalid characters.

Here's the implementation:

```swift
class Solution {
    func isMatch(_ string: String, _ pattern: String) -> Bool {
        let stringArray = Array(string)
        let patternArray = Array(pattern)

        let stringLength = stringArray.count
        let patternLength = patternArray.count

        var table = Array(
            repeating: Array(repeating: false, count: patternLength + 1),
            count: stringLength + 1
        )

        table[stringLength][patternLength] = true

        for s in (0...stringLength).reversed() {
            for p in (0..<patternLength).reversed() {
                let firstMatch = s < stringLength 
                    && (stringArray[s] == patternArray[p] || patternArray[p] == ".")

                if p + 1 < patternLength && patternArray[p + 1] == "*" {
                    table[s][p] = firstMatch && table[s + 1][p] || table[s][p + 2]
                } else {
                    table[s][p] = firstMatch && table[s + 1][p + 1]
                }
            }
        }

        return table[0][0]
    }
}
```

This implementation provides a solution to the Regular Expression Matching problem in Swift.