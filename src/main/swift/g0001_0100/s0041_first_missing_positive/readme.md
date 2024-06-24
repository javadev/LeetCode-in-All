41\. First Missing Positive

Hard

Given an unsorted integer array `nums`, return the smallest missing positive integer.

You must implement an algorithm that runs in `O(n)` time and uses constant extra space.

**Example 1:**

**Input:** nums = [1,2,0]

**Output:** 3 

**Example 2:**

**Input:** nums = [3,4,-1,1]

**Output:** 2 

**Example 3:**

**Input:** nums = [7,8,9,11,12]

**Output:** 1 

**Constraints:**

*   <code>1 <= nums.length <= 5 * 10<sup>5</sup></code>
*   <code>-2<sup>31</sup> <= nums[i] <= 2<sup>31</sup> - 1</code>

To solve the "First Missing Positive" problem in Swift with a `Solution` class, we can follow these steps:

1. Define a `Solution` class.
2. Define a method named `firstMissingPositive` that takes an array of integers `nums` as input and returns the smallest missing positive integer.
3. Iterate through the array and mark the positive integers found by negating the value at the corresponding index.
4. Iterate through the modified array again and return the index of the first positive number (which is the smallest missing positive integer).
5. If no positive number is found, return `nums.length + 1`.

Here's the implementation:

```swift
public class Solution {
    public func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        for i in 0..<nums.count {
            while nums[i] > 0 && nums[i] <= nums.count && nums[i] != i + 1 {
                let val = nums[i]
                if nums[val - 1] == val {
                    break
                }
                nums.swapAt(i, val - 1)
            }
        }
        for i in 0..<nums.count {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        return nums.count + 1
    }
}
```

This implementation provides a solution to the "First Missing Positive" problem in Swift. It marks positive integers found by negating the value at the corresponding index and then iterates through the modified array to find the smallest missing positive integer. If no positive number is found, it returns `nums.length + 1`.