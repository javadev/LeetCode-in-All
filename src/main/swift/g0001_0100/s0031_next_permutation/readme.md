31\. Next Permutation

Medium

Implement **next permutation**, which rearranges numbers into the lexicographically next greater permutation of numbers.

If such an arrangement is not possible, it must rearrange it as the lowest possible order (i.e., sorted in ascending order).

The replacement must be **[in place](http://en.wikipedia.org/wiki/In-place_algorithm)** and use only constant extra memory.

**Example 1:**

**Input:** nums = [1,2,3]

**Output:** [1,3,2] 

**Example 2:**

**Input:** nums = [3,2,1]

**Output:** [1,2,3] 

**Example 3:**

**Input:** nums = [1,1,5]

**Output:** [1,5,1] 

**Example 4:**

**Input:** nums = [1]

**Output:** [1] 

**Constraints:**

*   `1 <= nums.length <= 100`
*   `0 <= nums[i] <= 100`

To solve the "Next Permutation" problem in Swift with a `Solution` class, we can follow these steps:

1. Define a `Solution` class.
2. Define a method named `nextPermutation` that takes an integer array `nums` as input and modifies it to find the next permutation in lexicographic order.
3. Find the first index `i` from the right such that `nums[i] > nums[i - 1]`. If no such index exists, reverse the entire array, as it's already the last permutation.
4. Find the smallest index `j` from the right such that `nums[j] > nums[i - 1]`.
5. Swap `nums[i - 1]` with `nums[j]`.
6. Reverse the suffix of the array starting from index `i`.

Here's the implementation:

```swift
class Solution {
    func swap(_ arr: inout [Int], _ i: Int, _ j: Int) {
            var temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
    }

    func nextPermutation(_ nums: inout [Int]) {
        var n = nums.count
        var i = n - 2
        while i >= 0 && nums[i] >= nums[i+1] {
            i -= 1
        }
        if i >= 0 {
            var k = n - 1
            while k > i {
                if nums[i] < nums[k] {
                    break
                }
                k -= 1
            }
            swap(&nums,i,k)

            for j in i+1..<n-1 {
                for k in j..<n {
                    if nums[j] > nums[k] {
                        swap(&nums,j,k)
                    }
                }
            }
        } else if n == 2 {
            swap(&nums,0,1)
        } else {
            nums = nums.sorted(by: { $0 < $1 })
        }
    }
}
```

This implementation provides a solution to the "Next Permutation" problem in Swift. It finds the next lexicographically greater permutation of the given array `nums` and modifies it in place.