4\. Median of Two Sorted Arrays

Hard

Given two sorted arrays `nums1` and `nums2` of size `m` and `n` respectively, return **the median** of the two sorted arrays.

The overall run time complexity should be `O(log (m+n))`.

**Example 1:**

**Input:** nums1 = [1,3], nums2 = [2]

**Output:** 2.00000

**Explanation:** merged array = [1,2,3] and median is 2. 

**Example 2:**

**Input:** nums1 = [1,2], nums2 = [3,4]

**Output:** 2.50000

**Explanation:** merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5. 

**Example 3:**

**Input:** nums1 = [0,0], nums2 = [0,0]

**Output:** 0.00000 

**Example 4:**

**Input:** nums1 = [], nums2 = [1]

**Output:** 1.00000 

**Example 5:**

**Input:** nums1 = [2], nums2 = []

**Output:** 2.00000 

**Constraints:**

*   `nums1.length == m`
*   `nums2.length == n`
*   `0 <= m <= 1000`
*   `0 <= n <= 1000`
*   `1 <= m + n <= 2000`
*   <code>-10<sup>6</sup> <= nums1[i], nums2[i] <= 10<sup>6</sup></code>

To solve the Median of Two Sorted Arrays problem in Swift using a `Solution` class, we'll follow these steps:

1. Define a `Solution` class with a method named `findMedianSortedArrays`.
2. Calculate the total length of the combined array (m + n).
3. Determine the middle index or indices of the combined array based on its length (for both even and odd lengths).
4. Implement a binary search algorithm to find the correct position for partitioning the two arrays such that elements to the left are less than or equal to elements on the right.
5. Calculate the median based on the partitioned arrays.
6. Handle edge cases where one or both arrays are empty or where the combined length is odd or even.
7. Return the calculated median.

Here's the implementation:

```swift
public class Solution {
    public func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let n1 = nums1.count
        let n2 = nums2.count
        
        if n1 > n2 {
            return findMedianSortedArrays(nums2, nums1)
        }
        
        var low = 0
        var high = n1
        
        while low <= high {
            let cut1 = (low + high) / 2
            let cut2 = (n1 + n2 + 1) / 2 - cut1
            
            let l1 = cut1 == 0 ? Int.min : nums1[cut1 - 1]
            let l2 = cut2 == 0 ? Int.min : nums2[cut2 - 1]
            let r1 = cut1 == n1 ? Int.max : nums1[cut1]
            let r2 = cut2 == n2 ? Int.max : nums2[cut2]
            
            if l1 <= r2 && l2 <= r1 {
                if (n1 + n2) % 2 == 0 {
                    return (Double(max(l1, l2)) + Double(min(r1, r2))) / 2.0
                } else {
                    return Double(max(l1, l2))
                }
            } else if l1 > r2 {
                high = cut1 - 1
            } else {
                low = cut1 + 1
            }
        }
        
        return 0.0
    }
}
```

This implementation provides a solution to the Median of Two Sorted Arrays problem in Swift with a runtime complexity of O(log(min(m, n))).