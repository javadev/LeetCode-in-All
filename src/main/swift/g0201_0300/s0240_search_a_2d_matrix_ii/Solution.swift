// #Medium #Top_100_Liked_Questions #Array #Binary_Search #Matrix #Divide_and_Conquer
// #Data_Structure_II_Day_4_Array #Binary_Search_II_Day_8 #Big_O_Time_O(n+m)_Space_O(1)
// #2024_07_01_Time_128_ms_(91.94%)_Space_16.1_MB_(66.13%)

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var r = 0
        var c = matrix[0].count - 1
        while r < matrix.count && c >= 0 {
            if matrix[r][c] == target {
                return true
            } else if matrix[r][c] > target {
                c -= 1
            } else {
                r += 1
            }
        }
        return false
    }
}
