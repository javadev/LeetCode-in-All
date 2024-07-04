// #Medium #Top_100_Liked_Questions #Array #Binary_Search #Matrix #Data_Structure_I_Day_5_Array
// #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_8 #Level_2_Day_8_Binary_Search
// #Udemy_2D_Arrays/Matrix #Big_O_Time_O(endRow+endCol)_Space_O(1)
// #2024_06_24_Time_8_ms_(89.33%)_Space_15.6_MB_(26.67%)

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let endRow = matrix.count
        let endCol = matrix[0].count
        var targetRow = 0
        var result = false

        for i in 0..<endRow {
            if matrix[i][endCol - 1] >= target {
                targetRow = i
                break
            }
        }

        for i in 0..<endCol {
            if matrix[targetRow][i] == target {
                result = true
                break
            }
        }

        return result
    }
}
