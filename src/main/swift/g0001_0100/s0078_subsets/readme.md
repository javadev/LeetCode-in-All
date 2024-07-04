78\. Subsets

Medium

Given an integer array `nums` of **unique** elements, return _all possible subsets (the power set)_.

The solution set **must not** contain duplicate subsets. Return the solution in **any order**.

**Example 1:**

**Input:** nums = [1,2,3]

**Output:** [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]] 

**Example 2:**

**Input:** nums = [0]

**Output:** [[],[0]] 

**Constraints:**

*   `1 <= nums.length <= 10`
*   `-10 <= nums[i] <= 10`
*   All the numbers of `nums` are **unique**.

To solve the "Subsets" problem in Swift with the Solution class, follow these steps:

1. Define a method `subsets` in the `Solution` class that takes an integer array `nums` as input and returns all possible subsets of `nums`.
2. Initialize an empty list to store the result subsets.
3. Implement a backtracking algorithm to generate all possible subsets:
   - Define a recursive helper function `generateSubsets` that takes the current subset, the current index in the array, and the array `nums` as parameters.
   - Base case: If the current index is equal to the length of `nums`, add the current subset to the result list.
   - Recursive case:
     - Include the current element in the subset and recursively call `generateSubsets` with the next index.
     - Exclude the current element from the subset and recursively call `generateSubsets` with the next index.
4. Call the `generateSubsets` function with an empty subset and the starting index 0.
5. Return the list containing all subsets.

Here's the implementation of the `subsets` method in Swift:

```swift
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        solve(nums, &res, [Int](), 0)
        return res
    }

    private func solve(_ nums: [Int], _ res: inout [[Int]], _ temp: [Int], _ start: Int) {
        res.append(temp)
        for i in start..<nums.count {
            var newTemp = temp
            newTemp.append(nums[i])
            solve(nums, &res, newTemp, i + 1)
        }
    }
}
```

This implementation uses backtracking to generate all possible subsets of the input array `nums`. It has a time complexity of O(2^N), where N is the number of elements in the input array.