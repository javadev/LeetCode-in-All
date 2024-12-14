// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Matrix
// #Udemy_2D_Arrays/Matrix #Big_O_Time_O(m*n)_Space_O(1)
// #2024_12_11_Time_0_ms_(100.00%)_Space_54_MB_(33.87%)

/**
 * @param {number[][]} matrix
 * @return {void} Do not return anything, modify matrix in-place instead.
 */
var setZeroes = function(matrix) {
    const m = matrix.length
    const n = matrix[0].length
    let row0 = false
    let col0 = false

    // Check if the first column needs to be set to 0 in the future
    for (let i = 0; i < m; i++) {
        if (matrix[i][0] === 0) {
            col0 = true
            break
        }
    }

    // Check if the first row needs to be set to 0 in the future
    for (let j = 0; j < n; j++) {
        if (matrix[0][j] === 0) {
            row0 = true
            break
        }
    }

    // Store the signals in the first row and first column
    for (let i = 1; i < m; i++) {
        for (let j = 1; j < n; j++) {
            if (matrix[i][j] === 0) {
                matrix[i][0] = 0
                matrix[0][j] = 0
            }
        }
    }

    // Mark cells as 0 based on the signals in the first row and column
    for (let i = 1; i < m; i++) {
        for (let j = 1; j < n; j++) {
            if (matrix[i][0] === 0 || matrix[0][j] === 0) {
                matrix[i][j] = 0
            }
        }
    }

    // Set the first column to 0 if needed
    if (col0) {
        for (let i = 0; i < m; i++) {
            matrix[i][0] = 0
        }
    }

    // Set the first row to 0 if needed
    if (row0) {
        for (let j = 0; j < n; j++) {
            matrix[0][j] = 0
        }
    }
};

export { setZeroes }
