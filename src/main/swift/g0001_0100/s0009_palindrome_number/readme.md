9\. Palindrome Number

Easy

Given an integer `x`, return `true` if `x` is palindrome integer.

An integer is a **palindrome** when it reads the same backward as forward. For example, `121` is palindrome while `123` is not.

**Example 1:**

**Input:** x = 121

**Output:** true 

**Example 2:**

**Input:** x = -121

**Output:** false

**Explanation:** From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome. 

**Example 3:**

**Input:** x = 10

**Output:** false

**Explanation:** Reads 01 from right to left. Therefore it is not a palindrome. 

**Example 4:**

**Input:** x = -101

**Output:** false 

**Constraints:**

*   <code>-2<sup>31</sup> <= x <= 2<sup>31</sup> - 1</code>

**Follow up:** Could you solve it without converting the integer to a string?

To solve the Palindrome Number problem in Swift using a `Solution` class, we'll follow these steps:

1. Define a `Solution` class with a method named `isPalindrome`.
2. Handle special cases where `x` is negative or divisible by 10 but not equal to zero, as they cannot be palindromes.
3. Initialize variables to keep track of the reversed number (`reversed`) and the original number (`original`).
4. Iterate through the digits of the original number `x`:
   - Extract the least significant digit using the modulo operator and append it to the reversed number.
   - Update `original` by removing the least significant digit using integer division.
5. Check if the reversed number is equal to the original number. If so, return `true`; otherwise, return `false`.

Here's the implementation:

```swift
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        var rev = 0
        var localX = x
        while localX > 0 {
            rev = rev * 10 + localX % 10
            localX /= 10
        }
        return rev == x
    }
}
```

This implementation provides a solution to the Palindrome Number problem in Swift.