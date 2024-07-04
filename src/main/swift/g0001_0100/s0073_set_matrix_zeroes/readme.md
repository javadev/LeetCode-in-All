73\. Set Matrix Zeroes

Medium

Given an `m x n` integer matrix `matrix`, if an element is `0`, set its entire row and column to `0`'s, and return _the matrix_.

You must do it [in place](https://en.wikipedia.org/wiki/In-place_algorithm).

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/08/17/mat1.jpg)

**Input:** matrix = [[1,1,1],[1,0,1],[1,1,1]]

**Output:** [[1,0,1],[0,0,0],[1,0,1]] 

**Example 2:**

![](https://assets.leetcode.com/uploads/2020/08/17/mat2.jpg)

**Input:** matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]

**Output:** [[0,0,0,0],[0,4,5,0],[0,3,1,0]] 

**Constraints:**

*   `m == matrix.length`
*   `n == matrix[0].length`
*   `1 <= m, n <= 200`
*   <code>-2<sup>31</sup> <= matrix[i][j] <= 2<sup>31</sup> - 1</code>

**Follow up:**

*   A straightforward solution using `O(mn)` space is probably a bad idea.
*   A simple improvement uses `O(m + n)` space, but still not the best solution.
*   Could you devise a constant space solution?

To solve the "Set Matrix Zeroes" problem in Swift with the Solution class, follow these steps:

1. Define a method `setZeroes` in the `Solution` class that takes a 2D integer matrix `matrix` as input and modifies it in place to set the entire row and column to zeros if an element is zero.
2. Initialize two boolean arrays `rowZero` and `colZero` of size `m` and `n` respectively, where `m` is the number of rows in the matrix and `n` is the number of columns. These arrays will track whether a row or column needs to be set to zero.
3. Iterate over the matrix to mark the rows and columns that contain zeros:
   - If `matrix[i][j]` is zero, set `rowZero[i] = true` and `colZero[j] = true`.
4. Iterate over the matrix again and set the entire row to zeros if `rowZero[i] = true` or the entire column to zeros if `colZero[j] = true`.
5. Return the modified matrix.

Here's the implementation of the `setZeroes` method in Swift:

```swift
class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var rows = Set<Int>()
        var columns = Set<Int>()

        //traverse the matrix
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                if matrix[i][j] == 0 {
                    rows.insert(i)
                    columns.insert(j)
                }
            }
        }

        //change rows
        for row in rows {
            matrix[row] = Array(repeating: 0, count: matrix[row].count)
        }

        //change columns
        for column in columns {
            for row in 0..<matrix.count {
                matrix[row][column] = 0
            }
        }
    }
}
```

This implementation modifies the matrix in place to set entire rows and columns to zeros, with a time complexity of O(m * n) and a space complexity of O(m + n), where `m` is the number of rows and `n` is the number of columns in the matrix.