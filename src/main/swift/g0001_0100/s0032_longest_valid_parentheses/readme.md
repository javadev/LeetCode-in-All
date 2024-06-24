32\. Longest Valid Parentheses

Hard

Given a string containing just the characters `'('` and `')'`, find the length of the longest valid (well-formed) parentheses substring.

**Example 1:**

**Input:** s = "(()"

**Output:** 2

**Explanation:** The longest valid parentheses substring is "()". 

**Example 2:**

**Input:** s = ")()())"

**Output:** 4

**Explanation:** The longest valid parentheses substring is "()()". 

**Example 3:**

**Input:** s = ""

**Output:** 0 

**Constraints:**

*   <code>0 <= s.length <= 3 * 10<sup>4</sup></code>
*   `s[i]` is `'('`, or `')'`.

To solve the "Longest Valid Parentheses" problem in Swift with a `Solution` class, we can follow these steps:

1. Define a `Solution` class.
2. Define a method named `longestValidParentheses` that takes a string `s` as input and returns an integer representing the length of the longest valid parentheses substring.
3. Initialize a stack to store the indices of characters.
4. Initialize a variable `maxLen` to store the maximum length of valid parentheses found so far.
5. Push `-1` onto the stack to mark the starting point of a potential valid substring.
6. Iterate through each character of the string:
   - If the character is `'('`, push its index onto the stack.
   - If the character is `')'`:
     - Pop the top index from the stack.
     - If the stack is empty after popping, push the current index onto the stack to mark the starting point of the next potential valid substring.
     - Otherwise, update `maxLen` with the maximum of the current `maxLen` and `i - stack.peek()`, where `i` is the current index and `stack.peek()` is the index at the top of the stack.
7. Return `maxLen`.

Here's the implementation:

```swift
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

```

This implementation provides a solution to the "Longest Valid Parentheses" problem in Swift. It finds the length of the longest valid parentheses substring in the given string `s`.