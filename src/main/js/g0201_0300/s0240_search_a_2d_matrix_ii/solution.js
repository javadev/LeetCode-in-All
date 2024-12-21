// #Medium #Top_100_Liked_Questions #Array #Binary_Search #Matrix #Divide_and_Conquer
// #Data_Structure_II_Day_4_Array #Binary_Search_II_Day_8 #Big_O_Time_O(n+m)_Space_O(1)
// #2024_12_21_Time_279_ms_(94.52%)_Space_52.4_MB_(56.59%)

/**
 * @param {number[][]} matrix
 * @param {number} target
 * @return {boolean}
 */
var searchMatrix = function(matrix, target) {
    let r = 0
    let c = matrix[0].length - 1

    while (r < matrix.length && c >= 0) {
        if (matrix[r][c] === target) {
            return true
        } else if (matrix[r][c] > target) {
            c--
        } else {
            r++
        }
    }

    return false
};

export { searchMatrix }
