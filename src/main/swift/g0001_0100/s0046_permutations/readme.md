46\. Permutations

Medium

Given an array `nums` of distinct integers, return _all the possible permutations_. You can return the answer in **any order**.

**Example 1:**

**Input:** nums = [1,2,3]

**Output:** [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]] 

**Example 2:**

**Input:** nums = [0,1]

**Output:** [[0,1],[1,0]] 

**Example 3:**

**Input:** nums = [1]

**Output:** [[1]] 

**Constraints:**

*   `1 <= nums.length <= 6`
*   `-10 <= nums[i] <= 10`
*   All the integers of `nums` are **unique**.

To solve the "Permutations" problem in Swift with a `Solution` class, we can follow these steps:

1. Define a `Solution` class.
2. Define a method named `permute` that takes an array of distinct integers `nums` as input and returns a list of all possible permutations.
3. Create an empty list to store the result permutations.
4. Call a recursive helper function named `permuteHelper` to generate permutations.
5. Inside the `permuteHelper` function:
   - If the current permutation size equals the length of the input array `nums`, add a copy of the current permutation to the result list.
   - Otherwise, iterate through each element of `nums`:
     - If the current element is not already in the permutation, add it to the current permutation, and recursively call `permuteHelper` with the updated permutation and the remaining elements of `nums`.
     - After the recursive call, remove the last element from the permutation to backtrack.
6. Return the result list.

Here's the implementation:

```swift
public class Solution {
    public func permute(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return []
        }
        var finalResult = [[Int]]()
        var currResult = [Int]()
        var used = [Bool](repeating: false, count: nums.count)
        permuteRecur(nums, &finalResult, &currResult, &used)
        return finalResult
    }

    private func permuteRecur(_ nums: [Int], _ finalResult: inout [[Int]], _ currResult: inout [Int], _ used: inout [Bool]) {
        if currResult.count == nums.count {
            finalResult.append(currResult)
            return
        }
        for i in 0..<nums.count {
            if used[i] {
                continue
            }
            currResult.append(nums[i])
            used[i] = true
            permuteRecur(nums, &finalResult, &currResult, &used)
            used[i] = false
            currResult.removeLast()
        }
    }
}
```

This implementation provides a solution to the "Permutations" problem in Swift. It generates all possible permutations of the given array of distinct integers using backtracking.