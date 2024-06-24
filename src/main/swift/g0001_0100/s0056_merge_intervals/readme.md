56\. Merge Intervals

Medium

Given an array of `intervals` where <code>intervals[i] = [start<sub>i</sub>, end<sub>i</sub>]</code>, merge all overlapping intervals, and return _an array of the non-overlapping intervals that cover all the intervals in the input_.

**Example 1:**

**Input:** intervals = [[1,3],[2,6],[8,10],[15,18]]

**Output:** [[1,6],[8,10],[15,18]]

**Explanation:** Since intervals [1,3] and [2,6] overlaps, merge them into [1,6]. 

**Example 2:**

**Input:** intervals = [[1,4],[4,5]]

**Output:** [[1,5]]

**Explanation:** Intervals [1,4] and [4,5] are considered overlapping. 

**Constraints:**

*   <code>1 <= intervals.length <= 10<sup>4</sup></code>
*   `intervals[i].length == 2`
*   <code>0 <= start<sub>i</sub> <= end<sub>i</sub> <= 10<sup>4</sup></code>

To solve the "Merge Intervals" problem in Swift with the Solution class, follow these steps:

1. Define a method `merge` in the `Solution` class that takes an array of integer arrays `intervals` as input and returns an array of the non-overlapping intervals that cover all the intervals in the input.
2. Sort the intervals based on the start times.
3. Initialize an ArrayList to store the merged intervals.
4. Iterate through the sorted intervals:
   - If the list of merged intervals is empty or the current interval's start time is greater than the end time of the last merged interval, add the current interval to the list of merged intervals.
   - Otherwise, merge the current interval with the last merged interval by updating its end time if needed.
5. Convert the ArrayList of merged intervals into an array and return it as the result.

Here's the implementation of the `merge` method in Swift:

```swift
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else { return intervals }
        var intervals = intervals
        intervals.sort{ a, b in 
            a[0] < b[0]
        }    
        // print("int : \(intervals)")
        var j = 0
        var merged = [intervals[0]]
        while j < intervals.count {
            let first = merged.removeLast()
            let second = intervals[j] 
            if first[0] <= second[0] && first[1] >= second[1] {
                merged.append([first[0], first[1]])
            } else if second[0] <= first[0] && second[1] >= first[1] {
                merged.append([second[0], second[1]]) 
            } else if first[1] >= second[0] && first[0] <= second[0] {
                merged.append([first[0], second[1]])
            }  else {
                merged.append(first)
                merged.append(second)
            }
            j += 1
        }
        return merged
    }
}
```

This implementation efficiently merges overlapping intervals in the given array `intervals` using sorting and iteration, with a time complexity of O(n log n) due to sorting.