// #Medium #Top_100_Liked_Questions #Array #Binary_Search #Matrix #Data_Structure_I_Day_5_Array
// #Algorithm_II_Day_1_Binary_Search #Binary_Search_I_Day_8 #Level_2_Day_8_Binary_Search
// #Udemy_2D_Arrays/Matrix #Big_O_Time_O(endRow+endCol)_Space_O(1)
// #2024_12_11_Time_0_ms_(100.00%)_Space_49.1_MB_(63.49%)

/**
 * @param {number[][]} matrix
 * @param {number} target
 * @return {boolean}
 */
var searchMatrix = function(matrix, target) {
    const endRow = matrix.length
    const endCol = matrix[0].length
    let targetRow = 0
    let result = false

    // Find the target row
    for (let i = 0; i < endRow; i++) {
        if (matrix[i][endCol - 1] >= target) {
            targetRow = i
            break
        }
    }

    // Search in the target row
    for (let i = 0; i < endCol; i++) {
        if (matrix[targetRow][i] === target) {
            result = true
            break
        }
    }

    return result
};

export { searchMatrix }
