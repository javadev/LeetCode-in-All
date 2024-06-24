7\. Reverse Integer

Medium

Given a signed 32-bit integer `x`, return `x` _with its digits reversed_. If reversing `x` causes the value to go outside the signed 32-bit integer range <code>[-2<sup>31</sup>, 2<sup>31</sup> - 1]</code>, then return `0`.

**Assume the environment does not allow you to store 64-bit integers (signed or unsigned).**

**Example 1:**

**Input:** x = 123

**Output:** 321 

**Example 2:**

**Input:** x = -123

**Output:** -321 

**Example 3:**

**Input:** x = 120

**Output:** 21 

**Example 4:**

**Input:** x = 0

**Output:** 0 

**Constraints:**

*   <code>-2<sup>31</sup> <= x <= 2<sup>31</sup> - 1</code>

To solve the Reverse Integer problem in Swift using a `Solution` class, we'll follow these steps:

1. Define a `Solution` class with a method named `reverse`.
2. Initialize variables to keep track of the reversed integer (`rev`), the sign of the input integer (`sign`), and the absolute value of the input integer (`x`).
3. Iterate through each digit of the input integer `x`:
   - Extract the least significant digit using the modulo operator.
   - Update the reversed integer `rev` by multiplying it by 10 and adding the extracted digit.
   - Update `x` by removing the least significant digit using integer division.
4. Check if the reversed integer `rev` overflows the signed 32-bit integer range. If so, return 0.
5. Return the reversed integer `rev` with the appropriate sign.

Here's the implementation:

```swift
class Solution {
    func reverse(_ x: Int) -> Int {
        var rev: Int = 0
        var number = x

        while number != 0 {
            let pop = number % 10
            number /= 10

            if rev > Int32.max / 10 || (rev == Int32.max / 10 && pop > 7) {
                return 0
            }
            if rev < Int32.min / 10 || (rev == Int32.min / 10 && pop < -8) {
                return 0
            }
            rev = rev * 10 + pop
        }

        return rev
    }
}
```

This implementation provides a solution to the Reverse Integer problem in Swift.