// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Math #Matrix
// #Data_Structure_II_Day_3_Array #Programming_Skills_II_Day_7 #Udemy_2D_Arrays/Matrix
// #Big_O_Time_O(n^2)_Space_O(1) #2024_06_23_Time_0_ms_(100.00%)_Space_15.9_MB_(65.50%)

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
