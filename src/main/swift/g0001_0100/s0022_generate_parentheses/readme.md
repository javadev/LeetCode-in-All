22\. Generate Parentheses

Medium

Given `n` pairs of parentheses, write a function to _generate all combinations of well-formed parentheses_.

**Example 1:**

**Input:** n = 3

**Output:** ["((()))","(()())","(())()","()(())","()()()"] 

**Example 2:**

**Input:** n = 1

**Output:** ["()"] 

**Constraints:**

*   `1 <= n <= 8`

To solve the "Generate Parentheses" problem in Swift with a `Solution` class, we can use a backtracking approach. Here are the steps:

1. Define a `Solution` class.
2. Define a method named `generateParenthesis` that takes an integer `n` as input and returns a list of strings representing all combinations of well-formed parentheses.
3. Create an empty list to store the result.
4. Call the recursive helper function `generateParenthesisHelper` with the empty string `""`, counts of open and close parentheses set to `0`, the value of `n`, and the result list.
5. In the `generateParenthesisHelper` function:
   - If the length of the current string is equal to `2 * n`, add it to the result list.
   - If the count of open parentheses is less than `n`, append an open parenthesis to the current string and call the function recursively with increased open count.
   - If the count of close parentheses is less than the count of open parentheses, append a close parenthesis to the current string and call the function recursively with increased close count.
6. Return the result list.

Here's the implementation:

```swift
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var sb = ""
        var ans = [String]()
        generate(&sb, &ans, n, n)
        return ans
    }

    private func generate(_ sb: inout String, _ str: inout [String], _ open: Int, _ close: Int) {
        if open == 0 && close == 0 {
            str.append(sb)
            return
        }
        if open > 0 {
            sb.append("(")
            generate(&sb, &str, open - 1, close)
            sb.removeLast()
        }
        if close > 0 && open < close {
            sb.append(")")
            generate(&sb, &str, open, close - 1)
            sb.removeLast()
        }
    }
}
```

This implementation provides a solution to the "Generate Parentheses" problem in Swift using a backtracking approach.