153\. Find Minimum in Rotated Sorted Array

Medium

Suppose an array of length `n` sorted in ascending order is **rotated** between `1` and `n` times. For example, the array `nums = [0,1,2,4,5,6,7]` might become:

*   `[4,5,6,7,0,1,2]` if it was rotated `4` times.
*   `[0,1,2,4,5,6,7]` if it was rotated `7` times.

Notice that **rotating** an array `[a[0], a[1], a[2], ..., a[n-1]]` 1 time results in the array `[a[n-1], a[0], a[1], a[2], ..., a[n-2]]`.

Given the sorted rotated array `nums` of **unique** elements, return _the minimum element of this array_.

You must write an algorithm that runs in `O(log n) time.`

**Example 1:**

**Input:** nums = [3,4,5,1,2]

**Output:** 1

**Explanation:** The original array was [1,2,3,4,5] rotated 3 times. 

**Example 2:**

**Input:** nums = [4,5,6,7,0,1,2]

**Output:** 0

**Explanation:** The original array was [0,1,2,4,5,6,7] and it was rotated 4 times. 

**Example 3:**

**Input:** nums = [11,13,15,17]

**Output:** 11

**Explanation:** The original array was [11,13,15,17] and it was rotated 4 times. 

**Constraints:**

*   `n == nums.length`
*   `1 <= n <= 5000`
*   `-5000 <= nums[i] <= 5000`
*   All the integers of `nums` are **unique**.
*   `nums` is sorted and rotated between `1` and `n` times.

To solve the problem of finding the minimum element in a rotated sorted array of unique elements, we can leverage the binary search algorithm due to its efficiency of ( O(log n) ) time complexity.

### Steps to Solve the Problem

1. **Initialize Pointers:**
   - Use two pointers, `left` and `right`, initialized to the start and end indices of the array respectively.

2. **Binary Search:**
   - Perform a binary search to find the minimum element:
     - Calculate the middle index `mid` as `(left + right) / 2`.
     - Compare the element at `mid` with the elements at `left` and `right`.
     - Adjust the search range based on the comparisons:
       - If `nums[mid] < nums[right]`, the minimum element must be in the left half including `mid`, so move `right` to `mid`.
       - Otherwise, the minimum element must be in the right half excluding `mid`, so move `left` to `mid + 1`.

3. **Terminate and Return:**
   - When `left` equals `right`, it will point to the minimum element.
   - Return `nums[left]` or `nums[right]`, as they will both point to the minimum element.

### Swift Implementation

Here’s the Swift implementation of the `Solution` class using the described approach:

```swift
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = left + (right - left) / 2
            
            // Check if the middle element is less than the rightmost element
            if nums[mid] < nums[right] {
                right = mid // Minimum must be in the left half including mid
            } else {
                left = mid + 1 // Minimum must be in the right half excluding mid
            }
        }
        
        // When left == right, it points to the minimum element
        return nums[left]
    }
}
```

### Explanation of the Swift Code

- **Initialization:** Start with `left` at the beginning of the array (`0`) and `right` at the end of the array (`nums.count - 1`).
  
- **Binary Search Loop:** 
  - Compute `mid` as the midpoint between `left` and `right`.
  - Compare `nums[mid]` with `nums[right]`:
    - If `nums[mid] < nums[right]`, this means the minimum element is in the left half (including `mid`). So, update `right` to `mid`.
    - Otherwise, the minimum element is in the right half (excluding `mid`). So, update `left` to `mid + 1`.

- **Termination:** 
  - When `left` equals `right`, it indicates that `left` (or `right`) points to the minimum element in the array.
  
- **Return:** 
  - Return `nums[left]` or `nums[right]`, which represents the minimum element found after the binary search completes.

This implementation efficiently finds the minimum element in a rotated sorted array of unique elements in ( O(log n) ) time complexity, meeting the problem's requirements.
