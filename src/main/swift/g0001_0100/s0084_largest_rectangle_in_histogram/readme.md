84\. Largest Rectangle in Histogram

Hard

Given an array of integers `heights` representing the histogram's bar height where the width of each bar is `1`, return _the area of the largest rectangle in the histogram_.

**Example 1:**

![](https://assets.leetcode.com/uploads/2021/01/04/histogram.jpg)

**Input:** heights = [2,1,5,6,2,3]

**Output:** 10

**Explanation:** The above is a histogram where width of each bar is 1. The largest rectangle is shown in the red area, which has an area = 10 units. 

**Example 2:**

![](https://assets.leetcode.com/uploads/2021/01/04/histogram-1.jpg)

**Input:** heights = [2,4]

**Output:** 4 

**Constraints:**

*   <code>1 <= heights.length <= 10<sup>5</sup></code>
*   <code>0 <= heights[i] <= 10<sup>4</sup></code>

To solve the "Largest Rectangle in Histogram" problem in Swift with the Solution class, follow these steps:

1. Define a method `largestRectangleArea` in the `Solution` class that takes an array of integers `heights` as input and returns the area of the largest rectangle in the histogram.
2. Implement a stack-based algorithm to find the largest rectangle:
   - Initialize a stack to store indices of bars in the histogram.
   - Iterate through each bar in the histogram:
     - If the stack is empty or the current bar's height is greater than or equal to the height of the bar at the top of the stack, push the current bar's index onto the stack.
     - If the current bar's height is less than the height of the bar at the top of the stack, keep popping bars from the stack until either the stack is empty or the height of the bar at the top of the stack is less than the height of the current bar.
       - Calculate the area of the rectangle formed by the popped bar using its height and width (the difference between the current index and the index of the previous bar in the stack or -1 if the stack is empty).
       - Update the maximum area if the calculated area is greater.
   - After iterating through all bars, pop the remaining bars from the stack and calculate the area of rectangles formed by them using the same method as above.
3. Return the maximum area calculated.

Here's the implementation of the `largestRectangleArea` method in Swift:

```swift
class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        return largestArea(heights, 0, heights.count)
    }

    private func largestArea(_ a: [Int], _ start: Int, _ limit: Int) -> Int {
        if a.isEmpty {
            return 0
        }
        if start == limit {
            return 0
        }
        if limit - start == 1 {
            return a[start]
        }
        if limit - start == 2 {
            let maxOfTwoBars = max(a[start], a[start + 1])
            let areaFromTwo = min(a[start], a[start + 1]) * 2
            return max(maxOfTwoBars, areaFromTwo)
        }
        if checkIfSorted(a, start, limit) {
            var maxWhenSorted = 0
            for i in start..<limit {
                if a[i] * (limit - i) > maxWhenSorted {
                    maxWhenSorted = a[i] * (limit - i)
                }
            }
            return maxWhenSorted
        } else {
            let minInd = findMinInArray(a, start, limit)
            return maxOfThreeNums(
                largestArea(a, start, minInd),
                a[minInd] * (limit - start),
                largestArea(a, minInd + 1, limit)
            )
        }
    }

    private func findMinInArray(_ a: [Int], _ start: Int, _ limit: Int) -> Int {
        var min = Int.max
        var minIndex = -1
        for index in start..<limit {
            if a[index] < min {
                min = a[index]
                minIndex = index
            }
        }
        return minIndex
    }

    private func checkIfSorted(_ a: [Int], _ start: Int, _ limit: Int) -> Bool {
        for i in (start + 1)..<limit {
            if a[i] < a[i - 1] {
                return false
            }
        }
        return true
    }

    private func maxOfThreeNums(_ a: Int, _ b: Int, _ c: Int) -> Int {
        return max(max(a, b), c)
    }
}
```

This implementation uses a stack-based approach to find the largest rectangle in the histogram, with a time complexity of O(N), where N is the number of bars in the histogram.