64\. Minimum Path Sum

Medium

Given a `m x n` `grid` filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.

**Note:** You can only move either down or right at any point in time.

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/11/05/minpath.jpg)

**Input:** grid = [[1,3,1],[1,5,1],[4,2,1]]

**Output:** 7

**Explanation:** Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum. 

**Example 2:**

**Input:** grid = [[1,2,3],[4,5,6]]

**Output:** 12 

**Constraints:**

*   `m == grid.length`
*   `n == grid[i].length`
*   `1 <= m, n <= 200`
*   `0 <= grid[i][j] <= 100`

To solve the "Minimum Path Sum" problem in Swift with the Solution class, follow these steps:

1. Define a method `minPathSum` in the `Solution` class that takes a 2D grid of non-negative numbers as input and returns the minimum sum of all numbers along the path from the top-left corner to the bottom-right corner of the grid.
2. Initialize a 2D array `dp` of size `m x n`, where `dp[i][j]` represents the minimum sum of the path from the top-left corner to position `(i, j)` in the grid.
3. Initialize `dp[0][0]` to the value of the top-left cell in the grid.
4. Initialize the first row and first column of `dp` based on the grid values and the previous cells in the same row or column.
5. Iterate over each position `(i, j)` in the grid, starting from the second row and second column:
   - Update `dp[i][j]` by adding the current grid value at `(i, j)` to the minimum of the values of the previous cells `(i-1, j)` and `(i, j-1)` in `dp`.
6. Return `dp[m-1][n-1]`, which represents the minimum path sum from the top-left corner to the bottom-right corner of the grid.

Here's the implementation of the `minPathSum` method in Swift:

```swift
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var matrix: [[Int]] = grid
        let n = grid.count - 1
        let m = grid[0].count - 1
        
        for i in 0...n {
            for j in 0...m {
                var step = matrix[i][j]
        
                if i > 0 && j > 0 {
                    step += min(matrix[i - 1][j], matrix[i][j - 1])
                } else if i > 0 && j == 0 {
                    step += matrix[i - 1][j]
                } else if j > 0 && i == 0 {
                    step += matrix[i][j - 1]
                }
                
                matrix[i][j] = step
            }
        }
        
        return matrix[n][m]
    }
}
```

This implementation efficiently calculates the minimum path sum using dynamic programming, with a time complexity of O(m * n) and a space complexity of O(m * n).