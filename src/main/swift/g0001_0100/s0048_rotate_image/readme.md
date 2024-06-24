48\. Rotate Image

Medium

You are given an `n x n` 2D `matrix` representing an image, rotate the image by **90** degrees (clockwise).

You have to rotate the image [**in-place**](https://en.wikipedia.org/wiki/In-place_algorithm), which means you have to modify the input 2D matrix directly. **DO NOT** allocate another 2D matrix and do the rotation.

**Example 1:**

![](https://assets.leetcode.com/uploads/2020/08/28/mat1.jpg)

**Input:** matrix = [[1,2,3],[4,5,6],[7,8,9]]

**Output:** [[7,4,1],[8,5,2],[9,6,3]] 

**Example 2:**

![](https://assets.leetcode.com/uploads/2020/08/28/mat2.jpg)

**Input:** matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]

**Output:** [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]] 

**Example 3:**

**Input:** matrix = [[1]]

**Output:** [[1]] 

**Example 4:**

**Input:** matrix = [[1,2],[3,4]]

**Output:** [[3,1],[4,2]] 

**Constraints:**

*   `matrix.length == n`
*   `matrix[i].length == n`
*   `1 <= n <= 20`
*   `-1000 <= matrix[i][j] <= 1000`

To solve the "Rotate Image" problem in Swift with a `Solution` class, we can follow these steps:

1. Define a `Solution` class.
2. Define a method named `rotate` that takes a 2D array `matrix` representing an image as input and rotates the image by 90 degrees clockwise.
3. Determine the number of layers in the matrix, which is equal to half of the matrix's size.
4. Iterate through each layer from outer to inner layers.
5. For each layer:
   - Iterate through each element in the current layer.
   - Swap the elements of the current layer in a clockwise manner.
6. Return the rotated matrix.

Here's the implementation:

```swift
public class Solution {
    public func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<(n / 2) {
            for j in i..<(n - i - 1) {
                let positions = [
                    (i, j), (j, n - 1 - i), (n - 1 - i, n - 1 - j), (n - 1 - j, i)
                ]
                var t = matrix[positions[0].0][positions[0].1]
                for k in 1..<positions.count {
                    let temp = matrix[positions[k].0][positions[k].1]
                    matrix[positions[k].0][positions[k].1] = t
                    t = temp
                }
                matrix[positions[0].0][positions[0].1] = t
            }
        }
    }
}
```

This implementation provides a solution to the "Rotate Image" problem in Swift. It rotates the given 2D matrix representing an image by 90 degrees clockwise in-place.
