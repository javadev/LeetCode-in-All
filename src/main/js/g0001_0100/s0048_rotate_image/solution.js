// #Medium #Top_100_Liked_Questions #Top_Interview_Questions #Array #Math #Matrix
// #Data_Structure_II_Day_3_Array #Programming_Skills_II_Day_7 #Udemy_2D_Arrays/Matrix
// #Big_O_Time_O(n^2)_Space_O(1) #2024_12_09_Time_0_ms_(100.00%)_Space_51.6_MB_(12.89%)

/**
 * @param {number[][]} matrix
 * @return {void} Do not return anything, modify matrix in-place instead.
 */
var rotate = function(matrix) {
    const n = matrix.length
    for (let i = 0; i < Math.floor(n / 2); i++) {
        for (let j = i; j < n - i - 1; j++) {
            const positions = [
                [i, j],
                [j, n - 1 - i],
                [n - 1 - i, n - 1 - j],
                [n - 1 - j, i],
            ];

            let temp = matrix[positions[0][0]][positions[0][1]]
            for (let k = 1; k < positions.length; k++) {
                const [row, col] = positions[k]
                const current = matrix[row][col]
                matrix[row][col] = temp
                temp = current
            }
            matrix[positions[0][0]][positions[0][1]] = temp
        }
    }
};

export { rotate }
