70\. Climbing Stairs

Easy

You are climbing a staircase. It takes `n` steps to reach the top.

Each time you can either climb `1` or `2` steps. In how many distinct ways can you climb to the top?

**Example 1:**

**Input:** n = 2

**Output:** 2

**Explanation:** There are two ways to climb to the top. 1. 1 step + 1 step 2. 2 steps 

**Example 2:**

**Input:** n = 3

**Output:** 3

**Explanation:** There are three ways to climb to the top. 1. 1 step + 1 step + 1 step 2. 1 step + 2 steps 3. 2 steps + 1 step 

**Constraints:**

*   `1 <= n <= 45`

To solve the "Climbing Stairs" problem in Swift with the Solution class, follow these steps:

1. Define a method `climbStairs` in the `Solution` class that takes an integer `n` as input and returns the number of distinct ways to climb to the top of the staircase with `n` steps.
2. Initialize an array `dp` of size `n+1` to store the number of distinct ways to reach each step.
3. Set `dp[0] = 1` and `dp[1] = 1` since there is only one way to reach the first and second steps.
4. Iterate over the steps from `2` to `n`:
   - At each step `i`, the number of distinct ways to reach step `i` is the sum of the number of ways to reach steps `i-1` and `i-2`.
   - Store this sum in `dp[i]`.
5. Return `dp[n]`, which represents the number of distinct ways to climb to the top of the staircase with `n` steps.

Here's the implementation of the `climbStairs` method in Swift:

```swift
public class Solution {
    public func climbStairs(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        var cache = [Int](repeating: 0, count: n)
        
        // Initializing the base cases
        cache[0] = 1
        cache[1] = 2
        
        for i in 2..<n {
            cache[i] = cache[i - 1] + cache[i - 2]
        }
        
        return cache[n - 1]
    }
}
```

This implementation efficiently calculates the number of distinct ways to climb the stairs using dynamic programming, with a time complexity of O(n) and a space complexity of O(n).