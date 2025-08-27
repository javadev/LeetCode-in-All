// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Matrix
// #Udemy_2D_Arrays/Matrix #Top_Interview_150_Matrix #Big_O_Time_O(m*n)_Space_O(1)
// #2024_06_24_Time_52_ms_(86.73%)_Space_16.8_MB_(16.81%)

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
