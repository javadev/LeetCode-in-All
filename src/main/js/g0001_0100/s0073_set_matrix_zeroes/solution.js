// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Hash_Table #Matrix
// #Udemy_2D_Arrays/Matrix #Top_Interview_150_Matrix #Big_O_Time_O(m*n)_Space_O(1)
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

    for (let i = 0; i < m; i++) {
        if (matrix[i][0] === 0) {
            col0 = true
            break
        }
    }

    for (let j = 0; j < n; j++) {
        if (matrix[0][j] === 0) {
            row0 = true
            break
        }
    }

    for (let i = 1; i < m; i++) {
        for (let j = 1; j < n; j++) {
            if (matrix[i][j] === 0) {
                matrix[i][0] = 0
                matrix[0][j] = 0
            }
        }
    }

    for (let i = 1; i < m; i++) {
        for (let j = 1; j < n; j++) {
            if (matrix[i][0] === 0 || matrix[0][j] === 0) {
                matrix[i][j] = 0
            }
        }
    }

    if (col0) {
        for (let i = 0; i < m; i++) {
            matrix[i][0] = 0
        }
    }

    if (row0) {
        for (let j = 0; j < n; j++) {
            matrix[0][j] = 0
        }
    }
};

export { setZeroes }
