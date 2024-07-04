152\. Maximum Product Subarray

Medium

Given an integer array `nums`, find a contiguous non-empty subarray within the array that has the largest product, and return _the product_.

It is **guaranteed** that the answer will fit in a **32-bit** integer.

A **subarray** is a contiguous subsequence of the array.

**Example 1:**

**Input:** nums = [2,3,-2,4]

**Output:** 6

**Explanation:** [2,3] has the largest product 6. 

**Example 2:**

**Input:** nums = [-2,0,-1]

**Output:** 0

**Explanation:** The result cannot be 2, because [-2,-1] is not a subarray. 

**Constraints:**

*   <code>1 <= nums.length <= 2 * 10<sup>4</sup></code>
*   `-10 <= nums[i] <= 10`
*   The product of any prefix or suffix of `nums` is **guaranteed** to fit in a **32-bit** integer.

To solve the "152. Maximum Product Subarray" problem in Swift using the provided `Solution` class:

### Steps to Solve the Problem

1. **Initialize Variables**:
   - Create a variable `left` to keep track of the product of elements from the left.
   - Create a variable `right` to keep track of the product of elements from the right.
   - Initialize a variable `res` to store the maximum product found so far.

2. **Iterate Through the Array**:
   - Use a loop to iterate through the array from the start to the end.
   - Simultaneously iterate through the array from the end to the start.

3. **Update Products**:
   - For each iteration, update the `left` product by multiplying it with the current element from the left side.
   - Update the `right` product by multiplying it with the current element from the right side.

4. **Handle Zeros**:
   - If the `left` product is zero, reset it to one to start a new subarray.
   - Similarly, if the `right` product is zero, reset it to one to start a new subarray.

5. **Update Maximum Product**:
   - Update the `res` with the maximum value between `res`, `left`, and `right`.

6. **Return Result**:
   - After completing the loop, return the maximum product found, converted to an integer.

### Swift Solution

```swift
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var left: Double = 1
        var right: Double = 1
        var j = nums.count - 1
        var res: Double = Double(Int.min)
        
        for i in 0..<nums.count {
            if left == 0 { left = 1 }
            if right == 0 { right = 1 }
            
            left *= Double(nums[i])
            right *= Double(nums[j])
            
            j -= 1
            
            res = max(res, max(left, right))
        }
        
        return Int(res)
    }
}
```

### Explanation of the Example Cases

- **Example 1**:
  - **Input**: `nums = [2,3,-2,4]`
  - The contiguous subarray `[2,3]` has the largest product `6`.
  - **Output**: `6`

- **Example 2**:
  - **Input**: `nums = [-2,0,-1]`
  - The maximum product subarray is `[0]` which has a product of `0`.
  - **Output**: `0`

### Constraints

- `1 <= nums.length <= 2 * 10^4`
- `-10 <= nums[i] <= 10`
- The product of any prefix or suffix of `nums` is guaranteed to fit in a 32-bit integer.

By following these steps and using the provided solution, you can solve the "152. Maximum Product Subarray" problem in Swift efficiently.