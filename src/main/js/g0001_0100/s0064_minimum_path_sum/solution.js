// #Medium #Top_100_Liked_Questions #Array #Dynamic_Programming #Matrix
// #Dynamic_Programming_I_Day_16 #Udemy_Dynamic_Programming #Big_O_Time_O(m*n)_Space_O(m*n)
// #2024_12_10_Time_3_ms_(83.07%)_Space_51.2_MB_(74.79%)

/**
 * @param {number[][]} grid
 * @return {number}
 */
var minPathSum = function(grid) {
    const rows = grid.length
    const cols = grid[0].length

    // Handle the special case where grid has only one cell
    if (rows === 1 && cols === 1) {
        return grid[0][0]
    }

    // Create a 2D array for dynamic programming
    const dm = Array.from({ length: rows }, () => Array(cols).fill(0))

    // Initialize the last column
    let s = 0
    for (let r = rows - 1; r >= 0; r--) {
        dm[r][cols - 1] = grid[r][cols - 1] + s
        s += grid[r][cols - 1]
    }

    // Initialize the last row
    s = 0
    for (let c = cols - 1; c >= 0; c--) {
        dm[rows - 1][c] = grid[rows - 1][c] + s
        s += grid[rows - 1][c]
    }

    // Recursive helper function
    const recur = (r, c) => {
        if (
            dm[r][c] === 0 &&
            r !== rows - 1 &&
            c !== cols - 1
        ) {
            dm[r][c] =
                grid[r][c] +
                Math.min(
                    recur(r + 1, c),
                    recur(r, c + 1)
                )
        }
        return dm[r][c]
    }

    // Start recursion from the top-left corner
    return recur(0, 0)
};

export { minPathSum }
