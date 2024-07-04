// #Medium #Array #Dynamic_Programming #Matrix #Dynamic_Programming_I_Day_16
// #Big_O_Time_O(m*n)_Space_O(m*n) #2024_07_01_Time_350_ms_(93.48%)_Space_18.3_MB_(82.61%)

class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0 && matrix[0].count > 0 else { return 0 }
        var square = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
        var curMaxLen = 0
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                // when first col or row, set value manually, avoid "-1" index as well
                if i == 0 || j == 0 {
                    square[i][j] = Int(String(matrix[i][j]))!
                }
                else if matrix[i][j] == "1" {
                    square[i][j] = min(min(square[i-1][j], square[i][j-1]), square[i-1][j-1]) + 1
                }
                curMaxLen = max(curMaxLen, square[i][j])
            }
        }
        return curMaxLen*curMaxLen
    }
}
