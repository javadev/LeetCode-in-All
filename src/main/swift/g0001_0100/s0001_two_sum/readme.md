1\. Two Sum

Easy

Given an array of integers `nums` and an integer `target`, return _indices of the two numbers such that they add up to `target`_.

You may assume that each input would have **_exactly_ one solution**, and you may not use the _same_ element twice.

You can return the answer in any order.

**Example 1:**

**Input:** nums = [2,7,11,15], target = 9

**Output:** [0,1]

**Explanation:** Because nums[0] + nums[1] == 9, we return [0, 1]. 

**Example 2:**

**Input:** nums = [3,2,4], target = 6

**Output:** [1,2] 

**Example 3:**

**Input:** nums = [3,3], target = 6

**Output:** [0,1] 

**Constraints:**

*   <code>2 <= nums.length <= 10<sup>4</sup></code>
*   <code>-10<sup>9</sup> <= nums[i] <= 10<sup>9</sup></code>
*   <code>-10<sup>9</sup> <= target <= 10<sup>9</sup></code>
*   **Only one valid answer exists.**

**Follow-up:** Can you come up with an algorithm that is less than <code>O(n<sup>2</sup>)</code> time complexity?

To solve the "Two Sum" problem in Swift using a `Solution` class, follow these steps:

1. **Understand the problem:** You need to find two indices in the array `nums` such that the numbers at those indices add up to `target`. Each input has exactly one solution, and the same element cannot be used twice.

2. **Plan your approach:** 
    - Use a dictionary to store the difference between the target and each number in the array. This dictionary will help in checking if the complement of the current number (i.e., `target - nums[i]`) has been seen before.
    - Iterate through the array, and for each element, check if it exists in the dictionary.
    - If it exists, return the indices of the current element and the stored element.
    - If it does not exist, add the element and its index to the dictionary.

3. **Implement the solution:**
    - Define the `Solution` class and the `twoSum` method.
    - Use a dictionary to keep track of the numbers and their indices.
    - Iterate through the array and perform the necessary checks and updates.

Here is the Swift implementation of the solution:

```swift
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // Create a dictionary to store the number and its index
        var numDict = [Int: Int]()
        
        // Iterate through the nums array
        for (index, num) in nums.enumerated() {
            // Calculate the complement
            let complement = target - num
            
            // Check if the complement exists in the dictionary
            if let complementIndex = numDict[complement] {
                // If found, return the indices
                return [complementIndex, index]
            }
            
            // Otherwise, add the current number and its index to the dictionary
            numDict[num] = index
        }
        
        // In case no solution is found (which shouldn't happen as per problem constraints)
        return []
    }
}

// Example usage:
let solution = Solution()
let nums1 = [2, 7, 11, 15]
let target1 = 9
print(solution.twoSum(nums1, target1))  // Output: [0, 1]

let nums2 = [3, 2, 4]
let target2 = 6
print(solution.twoSum(nums2, target2))  // Output: [1, 2]

let nums3 = [3, 3]
let target3 = 6
print(solution.twoSum(nums3, target3))  // Output: [0, 1]
```

### Explanation:
- **Dictionary (`numDict`):** This dictionary keeps track of each number and its index as we iterate through the array.
- **Iteration:** For each number in the array, calculate the complement (`target - num`).
- **Check:** If the complement is already in the dictionary, return the indices of the complement and the current number.
- **Update:** If not, add the current number and its index to the dictionary and continue.

This approach ensures that the solution has a time complexity of \(O(n)\), which is efficient for large input sizes.